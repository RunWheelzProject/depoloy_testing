# Docker Build Stage
FROM maven:3.8.5-openjdk-11 AS maven_build

WORKDIR G:/workdir

ARG JAR_FILE=target/*.jar

COPY --from=build ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
