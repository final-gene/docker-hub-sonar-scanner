#!/usr/bin/env sh

ENTRYPOINT_COMMAND=sonar-scanner
NO_CMD=1
SONAR_HOST_OPTIONS=

# Check for binary if first arg doesn't starts with `-`
if [ "${1}" != "" -a "${1:0:1}" != "-" ]; then
    which $1 > /dev/null
    NO_CMD=$?
fi

if [ ! -z "${SONAR_HOST_URL}" ]; then
    SONAR_HOST_OPTIONS="${SONAR_HOST_OPTIONS} -Dsonar.host.url=${SONAR_HOST_URL}"
fi
if [ ! -z "${SONAR_LOGIN_TOKEN}" ]; then
    SONAR_HOST_OPTIONS="${SONAR_HOST_OPTIONS} -Dsonar.login=${SONAR_LOGIN_TOKEN}"
fi

export SONAR_SCANNER_OPTS="${SONAR_SCANNER_OPTS} ${SONAR_HOST_OPTIONS}"

# Run given command if the first arg matches the entry point command
if [ "$1" = "${ENTRYPOINT_COMMAND}" ]; then
  set -- "$@"
# Pass all arguments to the entry point command
elif [ ${NO_CMD} -eq 1 ]; then
  set -- ${ENTRYPOINT_COMMAND} "$@"
fi

# Run the command
exec "$@"
