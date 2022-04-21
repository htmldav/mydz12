FROM ubuntu:16.04
# RUN apt-get -y update
RUN apt-get -y install openjdk-8-jdk wget maven git
RUN mkdir /usr/local/tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.96/bin/apache-tomcat-7.0.96.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-7.0.96/* /usr/local/tomcat/
# RUN mkdir /usr/local/tomcat/webapps/ROOT
RUN git clone https://github.com/htmldav/dz12.git
RUN cd dz12 && mvn package
RUN cp /dz12/WebContent/Config.properties /usr/local/tomcat/webapps/ROOT
RUN cp /dz12/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run