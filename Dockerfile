# Use OpenJDK 21 base image
FROM openjdk:21-jdk-slim

# Set work directory
WORKDIR /app

# Copy the built jar from target
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8082

# Run the jar
ENTRYPOINT ["java","-jar","app.jar"]
