# Use an official Java runtime as a parent image
FROM openjdk:11

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the JDK and download the servlet API
RUN apt-get update && apt-get install -y openjdk-11-jdk wget \
    && wget https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/5.0.0/jakarta.servlet-api-5.0.0.jar -P /app

# Compile the Java application
RUN javac -cp /app/jakarta.servlet-api-5.0.0.jar /app/src/main/java/com/example/DatabaseServlet.java

# Run the application
CMD ["java", "-cp", "/app:/app/jakarta.servlet-api-5.0.0.jar", "com.example.DatabaseServlet"]


