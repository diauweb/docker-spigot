#!/bin/bash

# Redirect input to stdin of dedicated server

cmd=$@

PID=`cat /var/run/spigot.pid`

echo "$cmd" > /proc/$PID/fd/0
