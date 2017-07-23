
FROM ubuntu:xenial
MAINTAINER Ramu.R "ramu.rajasekaran@gmail.com"

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list
RUN apt-get update
RUN sudo apt-get install oracle-java8-installer

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle

WORK_DIR /home/ramur

ADD microservice.jar /home/ramur

CMD ["java", "-jar", "microservice.jar"] 
