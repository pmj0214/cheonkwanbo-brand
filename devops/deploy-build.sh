#!/bin/bash

# Param Setting
VERSION=$1
ALM_JENKINS_PATH=$2
SERVER_IP=$3
PROFILE=$4
SERVER_DOMAIN=$5

echo "==> server domain = ${SERVER_DOMAIN}"
echo "==> previous get sevice info"

    IDLE_PORT=`curl -k ${SERVER_DOMAIN}/port`
    echo "==> IDLE_PORT First = ${IDLE_PORT} "
    IDLE_APPLICATION="cheonkwanbo-brand-${IDLE_PORT}.war"
    if [ "${IDLE_PORT}" == "8086" ]
    then
        #IDLE_APPLICATION="cheonkwanbo-brand-${IDLE_PORT}.war"
        IDLE_REAL_PORT=8087
    elif [ "${IDLE_PORT}" == "8087" ]
    then
        #IDLE_APPLICATION="cheonkwanbo-brand-${IDLE_PORT}.war"
        IDLE_REAL_PORT=8086
    else
        IDLE_APPLICATION="cheonkwanbo-brand-8086.war"
        IDLE_REAL_PORT=8086
        IDLE_PORT=""
    fi
echo "==> cheonkwanbo-brand IDLE_APPLICATION = ${IDLE_APPLICATION}"
echo "==> cheonkwanbo-brand IDLE_PORT = ${IDLE_PORT}"
echo "==> cheonkwanbo-brand IDLE_REAL_PORT = ${IDLE_REAL_PORT}"
    if [ "${IDLE_PORT}" != "" ]
    then
        IDLE_PID_STRING="pgrep -f ${IDLE_APPLICATION}"
        IDLE_PID=`ssh root@${SERVER_IP} "${IDLE_PID_STRING}"`
    fi
echo "==> cheonkwanbo-brand IDLE_PID = ${IDLE_PID}"

DEFAULT_PATH="/var/www/cheonkwanbobrand"
DEPLOY_PATH="${DEFAULT_PATH}/deploy/${IDLE_REAL_PORT}"
IDLE_APPLICATION_PATH="cheonkwanbo-brand-${IDLE_REAL_PORT}-${VERSION}.war"
IDLE_APPLICATION_REAL="cheonkwanbo-brand-${IDLE_REAL_PORT}.war"

echo "==> bulid file copy : ${DEPLOY_PATH}/${IDLE_APPLICATION_PATH}"
    scp ${ALM_JENKINS_PATH}/cheonkwanbo-brand-${VERSION}.war root@${SERVER_IP}:${DEPLOY_PATH}/${IDLE_APPLICATION_PATH}
    ssh root@${SERVER_IP} "ln -Tfs ${DEPLOY_PATH}/${IDLE_APPLICATION_PATH} ${DEFAULT_PATH}/${IDLE_APPLICATION_REAL}"

JAVA_RUN="java -Dserver.port=${IDLE_REAL_PORT} -Dspring.profiles.active=${PROFILE} -Djava.net.preferIPv4Stack=true -jar ${DEFAULT_PATH}/${IDLE_APPLICATION_REAL} &> ${DEFAULT_PATH}/logs/execute-$(date '+%Y-%m-%d').log &"
echo "==> run service : ${JAVA_RUN}"
    ssh root@${SERVER_IP} "${JAVA_RUN}"

echo "==> nginx port forword modify"
    ssh root@${SERVER_IP} "echo 'set \$service_url http://127.0.0.1:${IDLE_REAL_PORT}\$uri\$is_args\$args;' | sudo tee /etc/nginx/conf.d/service-url.inc"

echo "==> nginx new deploy server health check"
    for retry_count in {1..10}
    do
        RESPONSE=`ssh root@${SERVER_IP} "curl -s http://localhost:${IDLE_REAL_PORT}/healthcheck"`
        HEALTH_COUNT=`echo $RESPONSE | grep 'hello!!' | wc -l`

        if [ "${HEALTH_COUNT}" -ge 1 ]
        then
            echo "==> ${IDLE_REAL_PORT} health check success"
            break
        else
            echo "==> ${IDLE_REAL_PORT} loading......"
        fi

        if [ "${retry_count}" -eq 10 ]
        then
            echo "==> ${IDLE_REAL_PORT} health check fail"
            echo "==> deploy END"
            exit 1
        fi

        echo "==> ${IDLE_REAL_PORT} health check retry......"
        sleep 3
    done

echo "==> nginx restart"
    ssh root@${SERVER_IP} "sudo /etc/init.d/nginx restart"

echo "==> previous namuh kill process : ${IDLE_PID}"
    ssh root@${SERVER_IP} "sudo kill -9 ${IDLE_PID}"




