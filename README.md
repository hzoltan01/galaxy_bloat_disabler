# Galaxy bloat disabler

A script that removes bloatware from Samsung phones without breaking anything in the system.

### How to run

```sh
./disable_bloatware.sh 
./disable_bloatware.sh spyware     # Includes the spyware package group
./disable_bloatware.sh bloatware   # Includes the bloatware package group
```

## disable_bloatware.sh
A sellscript intended to be copied to /data/local/tmp and run from ADB shell.
Removes all listed packages and disables telemetry using android settings.

## debloat_device.sh
A helper script to push and run disable_bloatware.sh on the phone.

Can be called with the **bloatware** and **spyware** options to add these groups to the list of packages to disable.

## update_settings.sh
After updating android settings from GUI, running this lists the updated values using txt files to store the current and last setting values.

## Package groups

### Unnecessary
Also spyware

| Package name | Function |
| ------------ | -------- |
| com.facebook.services <br> com.facebook.system <br> com.facebook.appmanager | Facebook and Messenger work without these being installed<br>Its behavior is undocumented |
| com.sem.factoryapp | Undocumented |
| de.telekom.tsc<br>com.aura.oobe.samsung  | Installs carrier apps |
| com.samsung.android.ipsgeofence | Visit in app<br>Tracks your location |
| com.samsung.android.mapsagent<br>com.samsung.android.app.omcagent | Autoinstalls applications |
| com.samsung.android.sm.devicesecurity | App "protection" by McAfee |
| com.samsung.android.rubin.app | Collects and analyzes data<br>No other functionality |
| com.android.providers.partnerbookmarks | Adds chrome bookmakrs and custom start page |
| com.sec.android.diagmonagent | Samsung diagnostic data |

### Spyware

| Package name | Function |
| ------------ | -------- |
| com.hiya.star | Caller ID |
| com.samsung.android.fast | Secure Wi-Fi<br>VPN by McAfee |
| com.android.chrome | Google Chrome |
| com.sec.android.app.chromecustomizations | Samsung Chrome customizatons |



### Bloatware

| Package name | Function |
| ------------ | -------- |
| com.microsoft.skydrive | OneDrive |
| com.microsoft.appmanager<br>com.samsung.android.mdx | Link to Windows |
| com.google.android.apps.tachyon | Google Meet |
| com.google.android.youtube | YouTube |
| de.axelspringer.yana.zeropage | Samsung news | 
