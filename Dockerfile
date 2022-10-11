# Docker Build Stage
FROM adoptopenjdk/openjdk11:latest

COPY target/docker_demo-0.0.1-SNAPSHOT.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
