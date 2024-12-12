FROM openjdk:21-jdk-slim

WORKDIR /app

COPY gradlew .
COPY gradle gradle
COPY build.gradle settings.gradle ./
COPY src/ ./src/

RUN chmod +x gradlew

RUN ./gradlew build

COPY build/libs/gateway-0.0.1-SNAPSHOT.jar gateway.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "gateway.jar"]
