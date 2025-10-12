#/!usr/bin/env bash

# Looks for a line ending with device
if ! adb devices | grep -q "device\$"; then
    print 'No ADB device found'
    exit 1
fi

adb push disable_bloatware.sh /data/local/tmp
adb shell chmod +x /data/local/tmp/disable_bloatware.sh
adb shell sh /data/local/tmp/disable_bloatware.sh