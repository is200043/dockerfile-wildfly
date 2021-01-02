FROM jboss/wildfly:21.0.1.Final

RUN cat /etc/os-release

RUN java -version

ENV TZ="Asia/Bangkok"
RUN date

ENV JAVA_OPTS="-server -Xms512m -Xmx3g -XX:MetaspaceSize=768M -XX:MaxMetaspaceSize=2048m -Djava.net.preferIPv4Stack=true"
ENV LANG='en_US.UTF-8'

EXPOSE 80
EXPOSE 443
EXPOSE 9990
EXPOSE 9993

RUN /opt/jboss/wildfly/bin/add-user.sh admin s0013816 --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Djboss.http.port=80", "-Djboss.https.port=443", "-Dfile.encoding=UTF8"]