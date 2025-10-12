#!/bin/zsh

get_settings() {
    local name=$1
    adb shell settings list "$name" > ${name}_new.txt || {
        print "Can't list $name settings"
        exit 1
    }
}

# Looks for a line ending with device
if ! adb devices | grep -q "device\$"; then
    print 'ADB Device not found'
    exit 1
fi


[[ -f global.txt ]] && rm global.txt
[[ -f secure.txt ]] && rm secure.txt
[[ -f system.txt ]] && rm system.txt


[[ -f global_new.txt ]] && mv global_new.txt global.txt
[[ -f secure_new.txt ]] && mv secure_new.txt secure.txt
[[ -f system_new.txt ]] && mv system_new.txt system.txt


get_settings global
get_settings secure
get_settings system


print GLOBAL DIFF
diff -N global.txt global_new.txt
print

print SECURE DIFF
diff -N secure.txt secure_new.txt
print

print SYSTEM DIFF
diff -N system.txt system_new.txt


