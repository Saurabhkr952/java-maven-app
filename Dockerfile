FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk:20-slim-buster
WORKDIR /app
COPY --from=build /app/target/java-maven-app-1.1.7.jar /app/
EXPOSE 8080
CMD [ "java","-jar","java-maven-app-1.1.7.jar" ]