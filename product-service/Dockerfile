FROM maven:3.9-eclipse-temurin-21 AS builder

WORKDIR /app
COPY pom.xml ./
COPY src ./src

RUN mvn -DskipTests package

FROM eclipse-temurin:21-jre-jammy

WORKDIR /app
COPY --from=builder /app/target/product-service-0.0.1-SNAPSHOT.jar product-service.jar

EXPOSE 8081

ENTRYPOINT ["java", "-XX:+UseContainerSupport", "-jar", "product-service.jar"]
