# Docker Build Stage
FROM adoptopenjdk/openjdk11:ppc64le-ubuntu-jre11u-2022-10-07-03-16-beta-nightly as build

ARG JAR_FILE=target/*.jar

COPY --from=build ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
