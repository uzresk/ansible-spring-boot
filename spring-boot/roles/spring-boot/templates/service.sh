#!/bin/sh

JAVA_HOME=/usr/java/default
APP_NAME={{SPRING_BOOT_APP_NAME}}
BASE_DIR={{SPRING_BOOT_BASE_DIR}}
JAR_FILE={{SPRING_BOOT_JAR_FILE}}
LOG_CONFIG_FILE={{SPRING_BOOT_LOG_CONFIG_FILE}}
PID={{SPRING_BOOT_PID}}
PROFILE={{SPRING_BOOT_PROFILE}}

case "$1" in
  "start" )
    if [ ! -f ${PID} ]; then
      echo "Starting ${APP_NAME}"
      ${JAVA_HOME}/bin/java -Xbootclasspath/a:. -Dspring.profiles.active=${PROFILE} -Dlogging.config=${LOG_CONFIG_FILE} -jar ${JAR_FILE} &
      echo $! > ${PID}
    else
      echo "${APP_NAME} is Running."
    fi
    ;;
  "stop" )
    echo "Stopping ${APP_NAME}"
    kill `cat ${PID}`
    RETVAL=$?
    if test $RETVAL -eq 0 ; then
        rm -f ${PID}
    fi
    ;;
  *)
    echo "Usage: service.sh start|stop"
    exit 1
esac
