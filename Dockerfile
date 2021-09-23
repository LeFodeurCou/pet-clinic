FROM maven:3.8.2-openjdk-16 as BUILDER

WORKDIR /tmp

COPY spring-petclinic/mvnw /tmp/mvnw
COPY spring-petclinic/.mvn /tmp/.mvn
COPY spring-petclinic/pom.xml /tmp/pom.xml
RUN mvn dependency:go-offline
COPY spring-petclinic/src/ /tmp/src/


RUN mvn package -DskipTests


FROM openjdk:16-jdk-alpine

COPY --from=BUILDER /tmp/target/spring-petclinic-2.5.0-SNAPSHOT.jar /opt/app.jar

ENTRYPOINT ["java","-jar", "-Dspring.profiles.active=mysql", "/opt/app.jar"]