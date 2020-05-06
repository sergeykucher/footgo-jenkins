FROM maven:3.6.3-jdk-8 as maven_depends
COPY ./footgo/pom.xml /footgo/
WORKDIR /footgo
RUN mvn clean package

FROM maven_depends as maven_build
COPY ./footgo /footgo
WORKDIR /footgo
RUN mvn clean package
RUN apt-get update && apt-get install -y dos2unix && dos2unix wait-for.sh

FROM openjdk:8-jre-alpine
COPY --from=maven_build /footgo/target/ROOT.jar /footgo/target/
COPY --from=maven_build /footgo/wait-for.sh /footgo/
COPY ./footgo/src/main/webapp /footgo/src/main/webapp
WORKDIR /footgo
