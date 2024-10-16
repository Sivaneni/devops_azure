# Use an official Tomcat image
FROM tomcat:9.0.96-jre17-temurin-noble
RUN apt-get update && apt-get install -y wget \
    && wget https://repo1.maven.org/maven2/jakarta/servlet/jakarta.servlet-api/5.0.0/jakarta.servlet-api-5.0.0.jar -P /usr/local/tomcat/lib/
# Copy the WAR file to the webapps directory
COPY target/getusers-1.war /usr/local/tomcat/webapps/

# Expose the port Tomcat is running on
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
