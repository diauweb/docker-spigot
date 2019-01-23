#!/bin/bash

echo "## By running this image, you accept our agreements and ##"
echo "## Mojang AB minecraft EULA.  Please visit              ##"
echo "## https://account.mojang.com/documents/minecraft_eula  ##"

echo "eula=TRUE" > $SPIGOT_HOME/eula.txt

# don't directly copy file into volumes during build
if [ ! -f $SPIGOT_HOME/spigot.jar ]; then
    echo ">> Spigot jar does not exist, copy from image build"
    cp /tmp/spigot.jar $SPIGOT_HOME/spigot.jar
fi

cd $SPIGOT_HOME

/opt/mcdaemon.d/server_run.sh java $JVM_OPTS -jar spigot.jar