#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <gc.log> <recording.jfr>"
  exit 1
fi

GC_LOG="$1"
JFR_FILE="$2"

for f in "$GC_LOG" "$JFR_FILE"; do
  [[ -f "$f" ]] || { echo "File not found: $f"; exit 1; }
done

TMP_GC=$(mktemp)
TMP_JFR=$(mktemp)
trap "rm -f $TMP_GC $TMP_JFR" EXIT

############################################
# 1. GC-derived allocation rate
############################################

awk '
/Pause Young/ {
  match($0, /\[([0-9.]+)s\]/, t)
  match($0, / ([0-9]+)M->[0-9]+M/, m)

  time = t[1]
  before = m[1]

  # skip warmup / tiny heaps
  if (before < 50) next

  print time, before
}
' "$GC_LOG" > "$TMP_GC"

GC_COUNT=$(wc -l < "$TMP_GC")
[[ "$GC_COUNT" -ge 2 ]] || { echo "Not enough GC samples"; exit 1; }

GC_TOTAL_MB=$(awk '{sum+=$2} END{print sum}' "$TMP_GC")
GC_START=$(awk 'NR==1{print $1}' "$TMP_GC")
GC_END=$(awk 'END{print $1}' "$TMP_GC")
GC_ELAPSED=$(awk "BEGIN{print $GC_END - $GC_START}")

GC_RATE_BYTES=$(awk "
BEGIN {
  printf \"%.0f\",
  ($GC_TOTAL_MB * 1024 * 1024) / $GC_ELAPSED
}")

############################################
# 2. JFR-derived allocation rate (NO jq)
############################################

# Dump allocation events as JSON
jfr print \
  --json \
  --events jdk.ObjectAllocationInNewTLAB,jdk.ObjectAllocationOutsideTLAB \
  "$JFR_FILE" > "$TMP_JFR"

# Sum allocationSize fields
JFR_TOTAL_BYTES=$(awk '
  /"allocationSize"[[:space:]]*:/ {
    gsub(/[^0-9]/, "", $0)
    sum += $0
  }
  END { print sum }
' "$TMP_JFR")

# Extract duration (seconds)
JFR_DURATION=$(jfr summary "$JFR_FILE" \
  | awk -F: '/Duration/ {
      gsub(/s/, "", $2)
      gsub(/^[[:space:]]+/, "", $2)
      print $2
    }')

[[ -n "$JFR_DURATION" && "$JFR_DURATION" != "0" ]] || {
  echo "Unable to determine JFR duration"
  exit 1
}

JFR_RATE_BYTES=$(awk "
BEGIN {
  printf \"%.0f\",
  $JFR_TOTAL_BYTES / $JFR_DURATION
}")

############################################
# 3. Comparison
############################################

DELTA_PCT=$(awk "
BEGIN {
  printf \"%.2f\",
  (($JFR_RATE_BYTES - $GC_RATE_BYTES) / $GC_RATE_BYTES) * 100
}")

############################################
# 4. Output
############################################

echo
echo "Object Allocation Rate Comparison"
echo "--------------------------------"
printf "GC-derived rate  : %12d bytes/sec\n" "$GC_RATE_BYTES"
printf "JFR-derived rate : %12d bytes/sec\n" "$JFR_RATE_BYTES"
printf "Difference       : %12s %%\n" "$DELTA_PCT"
echo

if awk "BEGIN{exit !($DELTA_PCT < 10 && $DELTA_PCT > -10)}"; then
  echo "Result: ✅ Rates are consistent (within ±10%)"
else
  echo "Result: ⚠️  Rates differ significantly — investigate"
fi

