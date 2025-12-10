FROM ubuntu:22.04

LABEL APP="Studentapp" DevopsEngg="Anup"

WORKDIR /opt/

# Install Java
RUN apt-get update -y && apt-get install -y openjdk-11-jdk wget tar && apt-get clean

# Use local Tomcat archive
COPY apache-tomcat-8.5.93.tar.gz .
RUN tar -xzvf apache-tomcat-8.5.93.tar.gz

WORKDIR /opt/apache-tomcat-8.5.93
COPY student.war webapps/student.war
COPY context.xml conf/context.xml
COPY mysql-connector.jar lib/mysql-connector.jar

EXPOSE 8080
CMD ["bin/catalina.sh", "run"]

