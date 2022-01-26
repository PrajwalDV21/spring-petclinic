FROM maven:3.8.4-openjdk as maven_builder
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat:8.5.43-jdk8
COPY --from=maven_builder /app/target/*.jar /usr/local/tomcat/webapps
