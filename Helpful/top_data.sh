
DC_TYPE=$1
OUTDIR=$PWD
RUNNUM=$2
R_TYPE="DATA"
JVM=$3

# Single BM (non-startup):
if [ $BM_NAME != "all" ]; then
   source ./data.sh ${DC_TYPE} ${RUNNUM} ${JVM}
else
for i in compress crypto.aes crypto.rsa crypto.signverify derby mpegaudio scimark.fft.large scimark.fft.small scimark.lu.large scimark.lu.small scimark.monte_carlo scimark.sor.large scimark.sor.small  scimark.sparse.large scimark.sparse.small serial sunflow xml.transform xml.validation
  do
    RUNNUM=${i}
    source ./data.sh ${DC_TYPE} ${RUNNUM} ${JVM}
  done
fi


