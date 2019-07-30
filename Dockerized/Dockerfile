FROM openjdk:8-jdk

# install git, curl, openssh server, and remove host keys
RUN apt-get update && apt-get install -y git curl openssh-server && mkdir /var/run/sshd && rm -rf /var/lib/apt/lists/* && rm -rf /etc/ssh/ssh_host_*

# jenkins
FROM jenkins/jenkins:lts-alpine
USER root
RUN apk add \
  docker \
  shadow
RUN usermod -aG docker jenkins
USER jenkins
COPY user /tmp/user
COPY pass /tmp/pass
COPY security.groovy /var/jenkins_home/init.groovy.d/security.groovy
COPY jenkins.yaml /var/jenkins_home/jenkins.yaml
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# get docker client
RUN mkdir -p /tmp/download && \
  curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz | tar -xz -C /tmp/download && \
  rm -rf /tmp/download/docker/dockerd && \
  mv /tmp/download/docker/docker* /usr/local/bin/ && \
  rm -rf /tmp/download && \
  groupadd -g 999 docker && \
  usermod -aG docker jenkins

# expose ssh port
EXPOSE 22

# make sure host keys are regenerated before sshd starts
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
