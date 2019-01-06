#!/bin/bash

echo ">> Try to build spigot..."
mkdir -p /tmp/spigot_build
cd /tmp/spigot_build
wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
HOME=/tmp/spigot_build java -jar BuildTools.jar --rev $MC_REV
cp /tmp/spigot_build/spigot-*.jar /tmp/spigot.jar && \ 
echo ">> Spigot.jar saved to /tmp/spigot.jar"
rm -rf /tmp/spigot_build && \
echo ">> Cleaned build files."
