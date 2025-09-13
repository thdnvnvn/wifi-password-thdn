#!/bin/bash
echo "==============================="
echo " Wi-Fi Password Viewer "
echo "==============================="
echo

if [ "$EUID" -ne 0 ]; then
    echo "Vui lòng chạy với quyền root (sudo)!"
    exit
fi

for file in /etc/NetworkManager/system-connections/*; do
    ssid=$(grep '^ssid=' "$file" | cut -d= -f2)
    psk=$(grep '^psk=' "$file" | cut -d= -f2)
    if [ ! -z "$ssid" ]; then
        echo "----------------------------"
        echo "Wi-Fi: $ssid"
        if [ ! -z "$psk" ]; then
            echo "Password: $psk"
        else
            echo "Password: <Không có mật khẩu>"
        fi
        echo
    fi
done