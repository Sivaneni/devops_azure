# Use an official Tomcat image
FROM tomcat:9.0

# Set the working directory
WORKDIR /usr/local/tomcat

# Copy the servlet API JAR to the lib directory
COPY /path/to/jakarta.servlet-api-5.0.0.jar /usr/local/tomcat/lib/

# Copy the source code to the container
COPY /app/src/main/java/com/example/ /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/com/example/

# Install the JDK
RUN apt-get update && apt-get install -y openjdk-11-jdk

# Compile the Java application
RUN javac -cp /usr/local/tomcat/lib/jakarta.servlet-api-5.0.0.jar /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/com/example/DatabaseServlet.java

# Expose the port Tomcat is running on
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]

