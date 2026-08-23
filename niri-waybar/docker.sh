#!/bin/bash

docker_ps_lines=$(docker ps | wc -l)

container_count=$((docker_ps_lines - 1))

printf "  %s" $container_count
