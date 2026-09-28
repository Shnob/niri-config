#!/bin/bash

icon_speakers="󰓃"
icon_headphones=""
icon_interface="󰀰"
icon_other=""

name_speakers="alsa_output.pci-0000_09_00.6.analog-stereo" 
name_headphones="bluez_output.80_C3_BA_3A_D2_62.1" 
name_interface="alsa_output.usb-BurrBrown_from_Texas_Instruments_USB_AUDIO_CODEC-00.pro-output-0" 

if [[ $1 -eq "" ]]; then
    default_sink=$(wpctl list audio sinks | grep '\*' | awk '{print $2}')

    if [[ $default_sink == $name_speakers ]]; then
        echo "$icon_speakers"
    elif [[ $default_sink == $name_headphones ]]; then
        echo "$icon_headphones"
    elif [[ $default_sink == $name_interface ]]; then
        echo "$icon_interface"
    else
        echo "$icon_other"
    fi
else
    if [[ $1 == "1" ]]; then
        $(wpctl set-default $(wpctl list audio sinks | grep "$name_speakers" | awk '{print $1}'))
    elif [[ $1 == "2" ]]; then
        $(wpctl set-default $(wpctl list audio sinks | grep "$name_headphones" | awk '{print $1}'))
    elif [[ $1 == "3" ]]; then
        $(wpctl set-default $(wpctl list audio sinks | grep "$name_interface" | awk '{print $1}'))
    fi
fi
