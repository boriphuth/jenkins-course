# jenkins-course

- This is the course material for the Jenkins Course on Udemy. See https://www.udemy.com/learn-devops-ci-cd-with-jenkins-using-pipelines-and-docker/?couponCode=JENKINS_GIT

https://linuxize.com/post/how-to-install-jenkins-on-ubuntu-18-04/
How To Install Jenkins on Ubuntu 18.04
$ sudo apt update
$ sudo apt install openjdk-8-jdk

# Docker

$ docker build -t jenkins-docker .
$ docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock --name jenkins -d jenkins-docker

#NodeJS Application
$ docker pull boriphuth/docker-nodejs-demo
$ docker run -p 3000:3000 -d --name my-nodejs-app boriphuth/docker-nodejs-demo

#Fix setup Jenkins-slave
# on Jenkins-master do
$ mkdir -p /var/jenkins_home/.ssh
$ cp /root/.ssh/authorized_keys /var/jenkins_home/.ssh/authorized_keys
$ chmod 700 /var/jenkins_home/.ssh
$ chmod 600 /var/jenkins_home/.ssh/authorized_keys
$ chown -R 1000:1000 /var/jenkins_home

128.199.228.211 ==> jenkins-slave ip
$ ssh-keyscan -p 2222 128.199.228.211 >> /var/jenkins_home/.ssh/known_hosts
