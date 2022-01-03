function check-adb
    command -q adb version # Slient output.
    if test $status = 0
        return 0
    else
        echo "ADB Not Found!"
        return 1
    end
end

function devices-count
    check-adb
    if test $status = 0
        if test (count (adb devices | sed -r '/^\s*$/d')) -gt 1
            return 0
        else
            echo "No Device in List!"
            return 1
        end
    else
        return 0
    end
end