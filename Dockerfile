# Use an official Tomcat image
FROM tomcat:9.0

# Copy the WAR file to the webapps directory
COPY target/getusers-1.war /usr/local/tomcat/webapps/

# Expose the port Tomcat is running on
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
