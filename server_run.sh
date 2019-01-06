#!/bin/bash
echo "Starting Spigot server $REV, pid=$$"

echo $$ > /var/run/spigot.pid

exec $@