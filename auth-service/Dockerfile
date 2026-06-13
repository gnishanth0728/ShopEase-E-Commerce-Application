FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app
COPY pom.xml ./
COPY src ./src

RUN mvn -DskipTests package

FROM eclipse-temurin:21-jre-jammy

WORKDIR /app
COPY --from=builder /app/target/auth-service-0.0.1-SNAPSHOT.jar auth-service.jar

EXPOSE 8080

ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-jar", "auth-service.jar"]
