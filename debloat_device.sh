#!/usr/bin/env bash

adb_error() {
    echo "$1"
    exit 1
}

unnecessary='
com.facebook.services
com.facebook.system
com.facebook.appmanager
com.sem.factoryapp
de.telekom.tsc
com.aura.oobe.samsung
com.samsung.android.ipsgeofence
com.samsung.android.mapsagent
com.samsung.android.app.omcagent
com.samsung.android.sm.devicesecurity
com.samsung.android.rubin.app
com.android.providers.partnerbookmarks
com.sec.android.diagmonagent
'

spyware='
com.hiya.star
com.samsung.android.fast
com.android.chrome
com.sec.android.app.chromecustomizations
'

bloatware='
com.microsoft.skydrive
com.microsoft.appmanager
com.samsung.android.mdx
com.google.android.youtube
com.google.android.apps.tachyon
de.axelspringer.yana.zeropage
'

echo "$unnecessary" > package_list.txt
[[ "$@" =~ "spyware" ]] && echo "$spyware" >> package_list.txt
[[ "$@" =~ "bloatware" ]] && echo "$bloatware" >> package_list.txt


# Looks for a line ending with device
adb devices | grep -q "device\$" || adb_error 'No ADB device found'

adb push disable_bloatware.sh /data/local/tmp || adb_error "Can't push disable_bloatware.sh to /data/local/tmp"
adb push package_list.txt /data/local/tmp || adb_error "Can't push package_list.txt to /data/local/tmp"
adb shell chmod +x /data/local/tmp/disable_bloatware.sh || adb_error "An error occurred while trying to execute adb shell"
adb shell sh /data/local/tmp/disable_bloatware.sh || adb_error "An error occurred while trying to execute adb shell"