#!/bin/bash

echo "## By running this image, you accept our agreements and ##"
echo "## Mojang AB minecraft EULA.  Please visit              ##"
echo "## https://account.mojang.com/documents/minecraft_eula  ##"

echo "eula=TRUE" > $SPIGOT_HOME/eula.txt

# don't directly copy file into volumes during build
if [ -f $SPIGOT_HOME/spigot.jar ]; then
    echo ">> Spigot jar exists, cleaning..."
    rm -f $SPIGOT_HOME/spigot.jar
fi
cp /tmp/spigot.jar $SPIGOT_HOME/spigot.jar

if [ ! -f $SPIGOT_HOME/restart.sh ]; then
    echo "#!/bin/bash" > $SPIGOT_HOME/restart.sh
    echo "echo 1 > /tmp/spigot-restart.wanted" >> $SPIGOT_HOME/restart.sh
    chmod +x $SPIGOT_HOME/restart.sh
fi

cd $SPIGOT_HOME

# Deal with restarts
echo 1 > /tmp/spigot-restart.wanted

while [ -f /tmp/spigot-restart.wanted ]
do
rm -f /tmp/spigot-restart.wanted
/opt/mcdaemon.d/server_run.sh java $JVM_OPTS -jar spigot.jar
done


