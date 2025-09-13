#!/bin/bash
echo "==============================="
echo " Wi-Fi Password Viewer "
echo "==============================="
echo

wifi_list=$(networksetup -listpreferredwirelessnetworks en0 | tail -n +2)

for ssid in $wifi_list; do
    echo "----------------------------"
    echo "Wi-Fi: $ssid"
    password=$(security find-generic-password -D "AirPort network password" -a "$ssid" -w 2>/dev/null)
    if [ $? -eq 0 ]; then
        echo "Password: $password"
    else
        echo "Password: <Không lấy được>"
    fi
    echo
done