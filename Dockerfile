# Docker Build Stage
FROM openjdk:11 AS build


# Build Stage
WORKDIR G:/workdir

COPY ./ G:/workdir
RUN mvn clean install -DskipTests





FROM openjdk:11
ARG JAR_FILE=target/*.jar

COPY --from=build ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
