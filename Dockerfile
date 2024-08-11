FROM maven:3.9.8-eclipse-temurin-21 as builder

ADD . /src
WORKDIR /src
RUN mvn package

FROM eclipse-temurin:21-jre as runner

COPY --from=builder /src/target/JMusicBot-Snapshot-All.jar /app/
WORKDIR /app
ENTRYPOINT ["java", "-Dnogui=true", "-jar", "JMusicBot-Snapshot-All.jar"]
