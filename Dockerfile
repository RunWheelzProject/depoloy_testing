# Docker Build Stage
FROM adoptopenjdk/openjdk11:latest

ARG JAR_FILE=target/docker_demo-0.0.1-SNAPSHOT.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
