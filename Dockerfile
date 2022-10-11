# Docker Build Stage
<<<<<<< HEAD
FROM openjdk:11 as build
=======
FROM openjdk:11 AS build
>>>>>>> 39b9555e7a2693789c1ea0c9f33b1f1cce3704cb


# Build Stage
WORKDIR G:/workdir

COPY ./ G:/workdir
RUN mvn clean install -DskipTests





FROM openjdk:11
ARG JAR_FILE=target/*.jar

COPY --from=build ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
