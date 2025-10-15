function adb_error {
    param(
        [string]$Message
    )
    Write-Error $Message
    exit 1
}

$unnecessary = @'
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
'@

$spyware = @'
com.hiya.star
com.samsung.android.fast
com.android.chrome
com.sec.android.app.chromecustomizations
'@

$bloatware = @'
com.microsoft.skydrive
com.microsoft.appmanager
com.samsung.android.mdx
com.google.android.youtube
com.google.android.apps.tachyon
de.axelspringer.yana.zeropage
'@

$unnecessary | Out-File -FilePath "package_list.txt"

if ($args -contains "spyware") {
    $spyware | Out-File -FilePath "package_list.txt" -Append
}

if ($args -contains "bloatware") {
    $bloatware | Out-File -FilePath "package_list.txt" -Append
}

if (-not (adb devices | Select-String -Pattern 'device$')) {
    adb_error 'No ADB device found'
}

adb push "disable_bloatware.sh" "/data/local/tmp"
if ($LASTEXITCODE -ne 0) {
    adb_error "Can't push disable_bloatware.sh to /data/local/tmp"
}
adb push "package_list.txt" "/data/local/tmp"
if ($LASTEXITCODE -ne 0) {
    adb_error "Can't push package_list.txt to /data/local/tmp"
}
adb shell "chmod +x /data/local/tmp/disable_bloatware.sh"
if ($LASTEXITCODE -ne 0) {
    adb_error "An error occurred while trying to execute adb shell"
}
adb shell "sh /data/local/tmp/disable_bloatware.sh"
if ($LASTEXITCODE -ne 0) {
    adb_error "An error occurred while trying to execute adb shell"
}
