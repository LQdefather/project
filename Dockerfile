FROM openjdk:8
COPY *.jar /app.jar
CMD ["--server.port=8899"]
EXPOSE 8899
ENTRYPOINT ["java","-jar","/app.jar"]
