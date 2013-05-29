#!/bin/sh
# jboss start shell

. ./env.sh
#cd ${JBOSS_HOME}/bin/
#./standalone.sh -c standalone-ha.xml -b ${DOMAIN_IP} &
#./standalone.sh --server-config=standalone-ha.xml -b ${DOMAIN_IP} -Djboss.server.base.dir=${SERVER_HOME} &
#./standalone.sh --server-config=standalone-ha.xml -b ${DOMAIN_IP} -Djboss.server.config.dir=${SERVER_HOME} &
#./standalone.sh -b ${DOMAIN_IP} -Djboss.server.config.dir=${SERVER_HOME} &
#./standalone.sh --server-config=standalone-ha.xml -b ${DOMAIN_IP}  -Djboss.server.log.threshold=INFO 1> ${SERVER_HOME}/log/console.log 2>&1 & 
./standalone.sh --server-config=standalone-ha.xml -b ${DOMAIN_IP} > ${SERVER_HOME}/log/console.log 2>&1 &  
sleep 1
tail -f ./log/console.log
