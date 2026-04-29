#!/bin/bash
set -uo pipefail
# bash脚本的"安全开关"-e:任何一个错误脚本停止运行  
# -u:如果使用没定义的变量会报错，pipfail:只要管道|中的任何一段失败，整个命令就算失败。
LOGFILE="test_runs_$(date +%s).log"

# Setup log file
echo "Logging to $LOGFILE" 

# Run tests until one fails
RUN=1
while "$@" > "$LOGFILE" 2>&1; do 
    echo "Run $RUN passed" 
    ((RUN++))
done

# Cleanup and report
echo "Test failed on run $RUN"
echo "Last 5 lines of output:"
tail -n 5 "$LOGFILE"
echo "Full log: $LOGFILE"
