#!/bin/bash
# Linux系统蓝牙设备电池电量显示

DEVICE=$("bluetoothctl" devices)
OUTPUT=$(bluetooth_battery A4:E0:A9:F7:EA:70 15:D2:38:EA:CD:F4)    #修改为你的蓝牙设备MAC地址，多个设备空格隔开

#任意键
get_char()
{
    SAVEDSTTY=`stty -g`
    stty -echo
    stty cbreak
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}
#任意键

IFS=$012        #012指定换行符'\n'为分割依据，不要使用'\n'，"040"是空格，"011"是Tab。
echo "蓝牙设备电池电量信息为："
echo $OUTPUT
echo ""
echo "MAC与设备对应关系："
echo "15:D2:38:EA:CD:F4 is for i12double;"     #修改为你的蓝牙设备标识
echo "A4:E0:A9:F7:EA:70 is for i12single."     #修改为你的蓝牙设备标识
unset IFS       #取消分隔符依据

#任意键退出 开始
echo ""
# echo "组合键 CTRL+C 终止运行脚本命令! ..."
echo "按任意键退出脚本运行..."
char=`get_char`
#任意键退出 结束

#20秒自动关闭 开始
# echo "本窗口将在20秒后关闭..."
# sleep 20
#20秒自动关闭 结束

#或终端直接执行的命令 bluetooth_battery A4:E0:A9:F7:EA:70 15:D2:38:EA:CD:F4