#!/bin/sh
# jboss start shell

. ./env.sh

#-----------------------------------------------
# 1. 
#unset JAVA_OPTS
MGMT_USER=`cat $SERVER_HOME/configuration/mgmt-users.properties  | grep jboss | awk -F '=' '{print $1}'`
MGMT_PWD=`cat $SERVER_HOME/configuration/mgmt-users.properties  | grep jboss | awk -F '=' '{print $2}'`

 
#$JBOSS_HOME/bin/shutdown.sh -S -s jnp://$DOMAIN_IP:$JNP_PORT -u $MGMT_USER -p $MGMT_PWD

#-----------------------------------------------
# 2. 
#kill -9 <code>ps axw | grep $NODE_NAME| grep -v grep | cut -c -5 | paste -s</code>
#-----------------------------------------------

#-----------------------------------------------
# 3.
#jboss.management.native.port=9999
MGMT_NATIVE_PORT=9999
export MGMT_PORT=$((${MGMT_NATIVE_PORT}+${OFFSET}))
echo "MGMT_USER:"$MGMT_USER "|MGMT_PWD:"$MGMT_PWD "|MGMT_PORT:"$MGMT_PORT

#${JBOSS_HOME}/bin/jboss-cli.sh --connect controller=${DOMAIN_IP}:${MGMT_PORT} command=:shutdown --user=${MGMT_USER} --password=${MGMT_PWD}
#${JBOSS_HOME}/bin/jboss-cli.sh --connect controller=${DOMAIN_IP}:${MGMT_PORT} command=:shutdown
${JBOSS_HOME}/bin/jboss-cli.sh --user=${MGMT_USER} --password=${MGMT_PWD} --connect controller=${DOMAIN_IP}:${MGMT_PORT} command=:shutdown
#-----------------------------------------------
