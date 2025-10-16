#!/system/bin/sh

# Disabling every package if installed
while read package; do
    if pm path $package > /dev/null 2>&1; then
        pm disable-user --user 0 $package || pm disable --user 0 $package || echo "Can't disable $package"
    fi
done < /data/local/tmp/package_list.txt

# Removing unnecessary settings

# User manual settings page
settings put global online_manual_url 0
echo 'User manual from system settings is removed'
# Remote control settings page
settings put system remote_control 0
echo 'Remote control from system settings is removed'


# Disable telemetry

# Play protect - Disable
settings put global package_verifier_user_consent -1 && echo 'Play Protect disabled'
# Personal data intelligence - Disable
settings put global sss_enabled 0 && echo 'Personal data and intelligence disabled'
# Send diagnostic data - Disable
settings put system samsung_errorlog_agree 0 && echo 'Send diagnostic data disabled'
# Android personalization service - Disable
settings put secure content_capture_enabled 0 && echo 'Android personalization service disabled'
# Usage and diagnostics - Disable
settings put global multi_cb 0 && echo 'Usage and diagnostics disabled'
# Process data only on device (Galaxy AI) - Enable
settings put system prevent_online_processing 1 && echo 'Process data only on device enabled (Galaxy AI)'


# Encrypted DNS
settings put global private_dns_mode hostname
settings put global private_dns_specifier 1dot1dot1dot1.cloudflare-dns.com