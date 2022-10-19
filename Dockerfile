FROM maven as build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:20-slim-buster
WORKDIR /app
COPY --from=build /app/target/java-maven-app-*.jar /app/
EXPOSE 8080
#CMD [ "java","-jar","java-maven-app-.jar" ]
CMD java -jar java-maven-app-*.jar