
FROM ubuntu:xenial
MAINTAINER Ramu.R "ramu.rajasekaran@gmail.com"

WORKDIR /home/ramur

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list
RUN apt-get update


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install -y --allow-unauthenticated oracle-java8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#RUN wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
#RUN tar zxvf apache-maven-3.3.9-bin.tar.gz
#RUN rm apache-maven-3.3.9-bin.tar.gz
#RUN mv apache-maven-3.3.9 maven
#ENV PATH $PATH:/home/ramur/maven/bin

#ADD pom.xml /home/ramur
#ADD src /home/ramur

ADD ps-microservice.jar /home/ramur

CMD ["java", "-classpath", "/home/ramur", "-jar", "ps-microservice.jar"]
