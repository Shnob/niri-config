#!/bin/bash

cpu=$(mpstat 1 1 | grep "all")

cpu=($cpu)

cpu_us="${cpu[2]}"
cpu_sy="${cpu[4]}"
cpu_wa="${cpu[5]}"
cpu_id="${cpu[11]}"

printf "  %sus %ssy %swa %sid" $cpu_us $cpu_sy $cpu_wa $cpu_id
