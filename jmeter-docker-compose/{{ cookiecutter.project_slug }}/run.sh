#!/bin/bash -e

JMETER_MODE="${JMETER_MODE:-interactive}"

run_jmeter_server_mode() {
   echo "Starting container in server mode..."
   jmeter-server
}

run_jmeter_client_mode() {
    echo "Starting container in client mode..."
    if [[ -z "${JMETER_TEST_SCRIPT}" ]]; then
        echo "JMETER_TEST_SCRIPT is not defined, exiting..."
        exit 1
    fi
    if [[ ! -e "${JMETER_TEST_SCRIPT}" ]]; then 
        echo "Script defined by JMETER_TEST_SCRIPT: $JMETER_TEST_SCRIPT is not found. Exiting..."
        exit 1
    fi
    if [[ -z "${JMETER_TEST_RESULT_DIR}" ]]; then 
        echo "JMETER_TEST_RESULT_DIR is not defined, exiting..."
        exit 1
    fi
    mkdir -p "${JMETER_TEST_RESULT_DIR}/report"

    echo "Waiting 10 seconds for the servers to start..."
    sleep 10
    echo "Starting jMeter process..."
    jmeter -n \
        -t "${JMETER_TEST_SCRIPT}" \
        -l "${JMETER_TEST_RESULT_DIR}/log.csv" \
        -e \
        -o "${JMETER_TEST_RESULT_DIR}/report" \
        -R"${JMETER_REMOTE_HOSTS}" \
        -X

    echo "jMeter test script succeeded."        
}

run_jmeter_interactive_mode() {
    if [[ -n "${JMETER_REMOTE_HOSTS}" ]]; then
        echo "Updating JMeter remote hosts to $JMETER_REMOTE_HOSTS"
        cp /opt/apache-jmeter/bin/jmeter.properties /opt/apache-jmeter/bin/jmeter.properties.original
        sed -i "s/^remote_hosts=.*\$/remote_hosts=$JMETER_REMOTE_HOSTS/" /opt/apache-jmeter/bin/jmeter.properties
    fi
    echo "Starting container in interactive mode."
    echo "To start the jMeter UI, "
    echo " 1. Open a bash terminal to the container with 'docker exec -it remote-testing-jmeter-client-1 bash'"
    echo " 2. Execute 'jmeter'"
    while true; do sleep 2; done
}

if [[ "${JMETER_MODE}" == "server" ]]; then
    run_jmeter_server_mode
elif [[ "${JMETER_MODE}" == "client" ]]; then
    run_jmeter_client_mode
elif [[ "${JMETER_MODE}" == "interactive" ]]; then
    run_jmeter_interactive_mode
else
    echo "Undefined JMETER_MODE: $JMETER_MODE. Please specify one of the following: server, interactive, client"
    exit 1
fi
