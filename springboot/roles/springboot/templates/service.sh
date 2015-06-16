#!/bin/sh

JAVA_HOME=/usr/java/default
APP_NAME={{ springboot.app_name }}
BASE_DIR={{ springboot.base_dir }}
JAR_FILE={{ springboot.jar_file }}
LOG_CONFIG_FILE={{ springboot.log_config_file }}
PID={{ springboot.pid }}
PROFILE={{ springboot.profile }}

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
