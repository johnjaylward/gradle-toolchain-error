#FROM eclipse-temurin:11-jdk-alpine AS build
# Use the official Gradle image as the base image
FROM gradle:8.12-jdk11-alpine AS build
# Set the working directory inside the container
WORKDIR /app

# Copy the applicaiton folder into the image
COPY . /app

# Grant execute permission for the Gradle wrapper
RUN chmod +x gradlew

# Run the Gradle build
RUN ./gradlew build

# Use a smaller base image for the final image
# FROM openjdk:8-jre-alpine

# # Set the working directory inside the container
# WORKDIR /app

# # Copy the built artifacts from the build stage
# COPY --from=build /app/build/libs /app/libs

# # Specify the command to run the application
# CMD ["java", "-jar", "/app/libs/your-application.jar"]