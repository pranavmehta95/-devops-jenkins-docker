FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /build

COPY app/pom.xml .
RUN mvn dependency:go-offline -q

COPY app/src ./src
RUN mvn clean package -DskipTests -q

FROM eclipse-temurin:17-jre AS runtime

RUN groupadd appgroup && useradd -g appgroup appuser

WORKDIR /app

COPY --from=builder /build/target/demo-1.0.0.jar app.jar

RUN chown appuser:appgroup app.jar

USER appuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
