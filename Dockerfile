FROM ubuntu:latest

# Copy these file into the container, just to simulate them existing.
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

# Copy the shell script to install everything manually.
COPY init.sh /init.sh

