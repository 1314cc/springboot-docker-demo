FROM openjdk:8-jre-alpine3.8

ARG JAR_FILE
VOLUME /tmp
ENV JAVA_OPTS="-Xmx1024m" \
    RUNNING_ENV="dev"
ADD ${JAR_FILE} app.jar
RUN sh -c 'touch /app.jar' \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENTRYPOINT [ "sh", "-c", "java -Denv=$RUNNING_ENV $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
