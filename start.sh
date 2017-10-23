#!/bin/bash

#Settings
[[ -f config.sh ]] && . config.sh
SERVICE="${FORGE:-server.jar}"
OPTIONS='nogui'
MCPATH="${SERVER_DIR}"
INVOCATION="java -server  \
	-Xms${START_MEMORY}M -Xmx${MAX_MEMORY}M  \
	-XX:+UseLargePages  \
	-XX:+UseLargePagesInMetaspace  \
	-XX:+AggressiveOpts  \
	-XX:ParallelGCThreads=4
	-XX:ConcGCThreads=2
	-Djline.terminal=unix -Djava.util.prefs.userRoot=${SERVER_DIR}  \
	-Djava.net.preferIPv4Stack=true  \
	-XX:+AlwaysPreTouch  \
	-XX:+UseG1GC  \
	-XX:+UnlockExperimentalVMOptions  \
	-XX:MaxGCPauseMillis=100  \
	-XX:+DisableExplicitGC  \
	-XX:TargetSurvivorRatio=90  \
	-XX:G1NewSizePercent=50  \
	-XX:G1MaxNewSizePercent=80 \
	-XX:InitiatingHeapOccupancyPercent=10  \
	-XX:G1MixedGCLiveThresholdPercent=50  \
	-XX:+AggressiveOpts \
	-XX:-UseAdaptiveSizePolicy \
	-XX:+UseFastAccessorMethods \
	-jar $SERVICE $OPTIONS"
#	-Dfml.doNotBackup=true -Dfml.queryResult=confirm  \

${INVOCATION}
