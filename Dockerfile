FROM centos:centos7

RUN yum -y update && \
 yum -y install wget && \
 yum -y install tar

RUN yum -y install java-1.8.0-openjdk-devel

RUN mkdir /usr/local/tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.32/* /usr/local/tomcat/
RUN chmod -R a+rwx /usr/share/tomcat/conf

EXPOSE 8080

CMD /usr/local/tomcat/bin/catalina.sh start