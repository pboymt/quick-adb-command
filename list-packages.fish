#!/bin/fish

source ./adb-utils.fish

function list-packages # 输出所有包名
    devices-count # 检查ADB状态
    if test $status -ne 0
        return 1
    end
    adb shell pm list packages | sed -E "s/package://"
end

list-packages
