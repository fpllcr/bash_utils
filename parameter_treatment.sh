#!/bin/bash

# Default parameters
env=PRO

# Parameter overwritting
for ar in $@ ; do
    K=${ar%=*}
    V=${ar##*=}
    export $K=$V
done

# Required parameters
for K in source cluster ; do
    eval V=\$$K
    if [ -z "$V" ]; then
        echo "Parameter $K is required"
        exit 1
    fi
done

# Date parameter
if [ -n "$dateParam" ]; then
    dateCompact=$(date -d "$dateParam" +'%Y%m%d')
    dateSlash=$(date -d "$dateParam" +'%Y/%m/%d')
    dateDash=$(date -d "$dateParam" +'%Y-%m-%d')
else
    dateCompact=$(/bin/date --date='-1 day' +%Y%m%d)
    dateSlash=$(/bin/date --date='-1 day' +%Y/%m/%d)
    dateDash=$(/bin/date --date='-1 day' +%Y-%m-%d)
fi

echo
echo "env: $env"
echo "source: $source"
echo "cluster: $cluster"
echo "dateCompact: $dateCompact"
echo "dateSlash: $dateSlash"
echo "dateDash: $dateDash"

exit 0