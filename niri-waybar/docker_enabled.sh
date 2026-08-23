#!/bin/bash

docker_ps_lines=$(docker ps | wc -l)

container_count=$((docker_ps_lines - 1))

if [[ $container_count -gt 0 ]]; then
    exit 0
else
    exit 1
fi
