FROM openjdk:8-jdk-alpine

ENV OPENFIRE_VERSION=4.6.0beta \
    OPENFIRE_USER=openfire \
    OPENFIRE_DATA_DIR=/var/lib/openfire \
    OPENFIRE_LOG_DIR=/var/log/openfire \
    DAEMON_DIR=/opt/openfire \
    DAEMON_LIB=/opt/openfire/lib

WORKDIR /opt/
RUN wget https://github.com/igniterealtime/Openfire/releases/download/v4.6.0beta/openfire_4_6_0_beta.tar.gz && tar -zxvf openfire_4_6_0_beta.tar.gz && rm openfire_4_6_0_beta.tar.gz
EXPOSE 3478/tcp 3479/tcp 5222/tcp 5223/tcp 5229/tcp 5275/tcp 5276/tcp 5262/tcp 5263/tcp 7070/tcp 7443/tcp 7777/tcp 9090/tcp 9091/tcp

COPY openfire.xml ${DAEMON_DIR}/conf/openfire.xml
RUN chmod 755 ${DAEMON_DIR}/conf/openfire.xml

USER root
CMD java -server -DopenfireHome=${DAEMON_DIR} \
    -Dopenfire.lib.dir=${DAEMON_LIB} -Dlog4j.configurationFile=${DAEMON_LIB}/log4j2.xml -classpath ${DAEMON_LIB}/startup.jar\
    -jar ${DAEMON_LIB}/startup.jar