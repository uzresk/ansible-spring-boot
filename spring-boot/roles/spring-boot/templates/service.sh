#!/bin/sh

JAVA_HOME=/usr/java/default

case "$1" in
  "start" )
    if [ ! -f ${{PID}} ]; then
      echo "Starting ${{APP_NAME}}"
      $JAVA_HOME/bin/java -Xbootclasspath/a:. -Dspring.profiles.active=${{PROFILE}} -Dlogging.config=${{LOG_CONFIG_FILE}} -jar ${{JAR_FILE}} &
      echo $! > ${{PID}}
    else
      echo "${{APP_NAME}} is Running."
    fi
    ;;
  "stop" )
    echo "Stopping ${{APP_NAME}}"
    kill `cat ${{PID}}`
    RETVAL=$?
    if test $RETVAL -eq 0 ; then
        rm -f ${{PID}}
    fi
    ;;
  *)
    echo "Usage: service.sh {start|stop}"
    exit 1
esac
