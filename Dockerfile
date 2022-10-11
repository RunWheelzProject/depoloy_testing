# Docker Build Stage
<<<<<<< HEAD
FROM maven:3.8.5-openjdk-11 AS maven_build

WORKDIR G:/workdir
=======
FROM adoptopenjdk/openjdk11:ppc64le-ubuntu-jre11u-2022-10-07-03-16-beta-nightly as build
>>>>>>> 627c4c11a1d99844303a92f71d2c4a4589383843

ARG JAR_FILE=target/*.jar

COPY --from=build ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
