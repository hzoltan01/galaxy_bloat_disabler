# Galaxy bloat disabler

## disable_bloatware.sh
A sellscript intended to be copied to /data/local/tmp and run from ADB shell.
Removes all listed packages and disables telemetry using android settings.

## run_adb_script.sh
A helper script to push and run disable_bloatware.sh on the phone.

## update_settings.sh
After updating android settings from GUI, running this lists the updated values using txt files to store the current and last setting values.