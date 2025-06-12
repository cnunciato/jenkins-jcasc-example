#!/bin/bash

set -e

echo "Waiting for Jenkins to start..."
sleep 15

echo "Registering '${JENKINS_AGENT_NAME}' with Jenkins..."
export JENKINS_SECRET=$(curl -s -X GET -u "${ADMIN_USERNAME}:${ADMIN_PASSWORD}" "${JENKINS_URL}/computer/$JENKINS_AGENT_NAME/slave-agent.jnlp" | xmllint --xpath "(/jnlp/application-desc/argument)[1]/text()" -)
exec jenkins-agent
