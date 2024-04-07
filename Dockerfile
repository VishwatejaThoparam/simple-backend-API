# First stage: Build the Spring Boot application using Maven
FROM maven:3-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Second stage: Use a lightweight Java runtime image to run the application
FROM openjdk:17.0.1-jdk-slim
WORKDIR /app
COPY --from=build /app/target/simple-backend-api-0.0.1-SNAPSHOT.jar simple-backend-api.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","simple-backend-api.jar"]
