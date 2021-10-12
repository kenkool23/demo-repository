FROM tomcat:latest
COPY SampleWebApp/target/ /usr/local/tomcat/webapps
EXPOSE 8080 
