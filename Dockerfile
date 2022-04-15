FROM tomcat
# RUN apt-get -y install openjdk-8-jdk maven git
RUN apt-get -y install maven git
RUN git clone https://github.com/htmldav/dz12.git
RUN cd dz12 && mvn package
# RUN mv -T /dz12/WebContent /dz12/ROOT
RUN cp /dz12/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run