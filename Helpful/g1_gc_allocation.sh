#!/usr/bin/env bash

LOGFILE="$1"

if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 <gc.log>"
    exit 1
fi

awk '
function to_bytes(mb) {
    return mb * 1024 * 1024
}

{
    if ($0 ~ /Pause Young/ && $0 ~ /->/) {

        # timestamp
        line = $0
        sub(/^\[/,"",line)
        sub(/s\].*$/,"",line)
        ts = line + 0

        # heap before->after
        heap=$0
        sub(/^.*Pause.* /,"",heap)
        sub(/\(.*/,"",heap)

        split(heap,a,"->")

        before=a[1]
        after=a[2]

        sub(/M$/,"",before)
        sub(/M$/,"",after)

        before_b=to_bytes(before)
        after_b=to_bytes(after)

        if(first_ts=="")
            first_ts=ts

        last_ts=ts

        if(prev_after!=""){
            alloc=before_b-prev_after
            if(alloc>0)
                total_alloc+=alloc
        }

        prev_after=after_b
    }
}

END{
    duration=last_ts-first_ts

    if(duration>0){
        rate=total_alloc/duration
        printf "Total Allocation: %.2f MB\n", total_alloc/(1024*1024)
        printf "Total Duration: %.3f sec\n", duration
        printf "Overall Allocation Rate: %.2f MB/sec\n", rate/(1024*1024)
    } else {
        print "Not enough young GC events"
    }
}
' "$LOGFILE"

