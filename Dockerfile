# Build WAR using Maven
FROM maven:3.9.6 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Deploy to Tomcat
FROM tomcat:9.0-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/target/LaundrySystem-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
