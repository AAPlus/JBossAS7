#!/bin/sh
# jboss-env.sh - starts a new shell with instance variables set

## set jboss env
export JAVA_HOME=/project/AA+/libs/jdk1.7.0
export JBOSS_HOME=/project/AA+/servers/jboss-as-7.1.1.Final
export SEQ=1
export NODE_NAME=standalone-node${SEQ}
export SERVER_HOME=${JBOSS_HOME}/${NODE_NAME}
export DOMAIN_IP=0.0.0.0
#export DOMAIN_IP=127.0.0.1
export OFFSET=100
export PORT_NAME=ports-${NODE_NAME}
export JBOSS_BASE_DIR=${SERVER_HOME}
export JBOSS_CONFIG_DIR=${SERVER_HOME}/configuration
export HOME_DIR=${SERVER_HOME}

export LAUNCH_JBOSS_IN_BACKGROUND=true
#export PRESERVE_JAVA_OPTS=false
export RUN_CONF=${SERVER_HOME}/standalone.conf
NATIVE_MOD_CLUSTER_MGMT_PORT=6666
#export MOD_CLUSTER_MGMT_PORT=$((${NATIVE_MOD_CLUSTER_MGMT_PORT}+${OFFSET}))
export MOD_CLUSTER_MGMT_PORT=${NATIVE_MOD_CLUSTER_MGMT_PORT}


#if [ "x$JBOSS_OPTS" = "x" ]; then
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.node.name=${NODE_NAME}"
#    JBOSS_OPTS="-Dserver=${NODE_NAME}"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.server.base.dir=${SERVER_HOME}"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.server.base.url=file://${SERVER_HOME}"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.server.log.dir=${SERVER_HOME}/log"
#    JBOSS_OPTS="$JBOSS_OPTS -Dorg.jboss.boot.log.file=${SERVER_HOME}/log/boot.log"
#    JBOSS_OPTS="$JBOSS_OPTS -Dlogging.configuration=file:${SERVER_HOME}/configuration/logging.properties"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.messaging.ServerPeerID=${SEQ}"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.service.binding.set=${PORT_NAME}"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.socket.binding.port-offset=${OFFSET}"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.partition.name=clusternode"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.partition.udpGroup=228.2.2.2"
#    JBOSS_OPTS="$JBOSS_OPTS -Djboss.hapartition.mcast_port=44552"
#fi

if [ "x$JAVA_OPTS" = "x" ]; then
    JAVA_OPTS="$JAVA_OPTS -Djboss.node.name=${NODE_NAME}"
    JAVA_OPTS="$JAVA_OPTS -Djboss.server.base.dir=${SERVER_HOME}"
    JAVA_OPTS="$JAVA_OPTS -Djboss.server.log.dir=${SERVER_HOME}/log"
    JAVA_OPTS="$JAVA_OPTS -Djboss.domain.deployment.dir=${SERVER_HOME}/deployments"
    JAVA_OPTS="$JAVA_OPTS -Dlogging.configuration=file=${SERVER_HOME}/configuration/logging.properties"
    JAVA_OPTS="$JAVA_OPTS -Djboss.server.config.dir=${SERVER_HOME}/configuration"

    JAVA_OPTS="-server"
    JAVA_OPTS="$JAVA_OPTS -noverify"
    JAVA_OPTS="$JAVA_OPTS -Xms256m"
    JAVA_OPTS="$JAVA_OPTS -Xmx256m"
    JAVA_OPTS="$JAVA_OPTS -XX:PermSize=128m"
    JAVA_OPTS="$JAVA_OPTS -XX:MaxPermSize=128m"
    JAVA_OPTS="$JAVA_OPTS -Xss160k"
 
    JAVA_OPTS="$JAVA_OPTS -verbose:gc"
    JAVA_OPTS="$JAVA_OPTS -Xloggc:${SERVER_HOME}/gclog/gc.log"
    JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCDetails"
    JAVA_OPTS="$JAVA_OPTS -XX:+PrintGCTimeStamps"
    JAVA_OPTS="$JAVA_OPTS -XX:+PrintHeapAtGC"
    JAVA_OPTS="$JAVA_OPTS -XX:+HeapDumpOnOutOfMemoryError"
    JAVA_OPTS="$JAVA_OPTS -XX:HeapDumpPath=${SERVER_HOME}/gclog/java_pid.hprof"
 
#    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote"
#    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.port=8286"
#    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.ssl=false"
#    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote.authenticate=false"
 
    JAVA_OPTS="$JAVA_OPTS -Djava.net.preferIPv4Stack=true"
    JAVA_OPTS="$JAVA_OPTS -Dsun.rmi.dgc.client.gcInterval=3600000"
    JAVA_OPTS="$JAVA_OPTS -Dsun.rmi.dgc.server.gcInterval=3600000"
    JAVA_OPTS="$JAVA_OPTS -Dsun.lang.ClassLoader.allowArraySyntax=true "
    JAVA_OPTS="$JAVA_OPTS -Djboss.socket.binding.port-offset=${OFFSET}"
#    JAVA_OPTS="$JAVA_OPTS -Dorg.jboss.boot.log.file=${SERVER_HOME}/log/boot.log"
#    JAVA_OPTS="$JAVA_OPTS -Dlogging.configuration=file:${SERVER_HOME}/configuration/logging.properties"
    JAVA_OPTS="$JAVA_OPTS -Djboss.bind.address=${DOMAIN_IP}"
    JAVA_OPTS="$JAVA_OPTS -Djboss.bind.address.management=${DOMAIN_IP}"
    JAVA_OPTS="$JAVA_OPTS -Djboss.bind.address.unsecure=${DOMAIN_IP}"
    JAVA_OPTS="$JAVA_OPTS -DDOMAIN_IP=${DOMAIN_IP}"
fi
 
export JBOSS_OPTS JAVA_OPTS
 
echo "================================================"
echo " JBOSS_HOME=$JBOSS_HOME"
echo "SERVER_HOME=$SERVER_HOME"
echo "NODE_NAME=$NODE_NAME"
echo "JAVA_OPTS=$JAVA_OPTS"
echo "================================================"
