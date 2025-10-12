#/!usr/bin/env bash

adb push disable_bloatware.sh /data/local/tmp
adb shell chmod +x /data/local/tmp/disable_bloatware.sh
adb shell sh /data/local/tmp/disable_bloatware.sh