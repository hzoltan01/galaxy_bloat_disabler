#!/system/bin/sh

# Put this script to /data/local/tmp to be able to make it executable and run it

packages='
com.hiya.star
com.facebook.services
com.facebook.system
com.facebook.appmanager
com.microsoft.skydrive
com.microsoft.appmanager
com.sem.factoryapp
de.axelspringer.yana.zeropage
de.telekom.tsc
com.google.android.youtube
com.google.android.apps.tachyon
com.google.android.safetycore
com.aura.oobe.samsung
com.samsung.android.fast
com.samsung.android.ipsgeofence
com.samsung.android.mapsagent
com.samsung.android.app.omcagent
com.samsung.android.sm.devicesecurit
com.samsung.android.mdx
com.samsung.android.rubin.app
com.android.providers.partnerbookmarks
com.android.chrome
com.sec.android.app.chromecustomizations
com.sec.android.diagmonagent
'

# Disabling every package if installed
for package in $packages; do
    if pm path $package > /dev/null 2>&1; then
        pm disable-user --user 0 $package || echo "Can't disable $package"
    fi
done

# Removing unnecessary settings

# User manual settings page
settings put global online_manual_url 0
# Remote control settings page
settings put system remote_control 0


# Disable telemetry

# Play protect - Disable
settings put global package_verifier_user_consent -1
# Personal data intelligence - Disable
settings put global sss_enabled 0
# Send diagnostic data - Disable
settings put system samsung_errorlog_agree 0
# Android personalization service - Disable
settings put secure content_capture_enabled 0
# Usage and diagnostics - Disable
settings put global multi_cb 0
# Galaxy AI local only - Enable
settings put system prevent_online_processing 1