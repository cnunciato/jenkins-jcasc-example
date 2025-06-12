FROM jenkins/inbound-agent

USER root
RUN apt-get update && apt-get install -y curl libxml2-utils
USER jenkins

COPY agent.sh /agent.sh
ENTRYPOINT ["/agent.sh"]
