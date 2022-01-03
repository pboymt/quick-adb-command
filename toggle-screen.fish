#!/bin/fish

source ./adb-utils.fish

function toggle-screen
    devices-count # 检查ADB状态
    if test $status -ne 0
        return 1
    end
    if test (adb shell dumpsys power | grep "state=" | grep -oE '(ON|OFF)') = "OFF"
        echo "Screen is off. Turning on."
        adb shell input keyevent 26 # wakeup
        adb shell input keyevent 82 # unlock
        echo "OK, should be on now."
    else
        echo "Screen is already on."
        echo "Turning off."
        adb shell input keyevent 26 # sleep
    end
end

toggle-screen
