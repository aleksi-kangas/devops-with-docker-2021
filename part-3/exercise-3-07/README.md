# Exercise 3 - 07

### Before
```bash
$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED         SIZE
spring-example-project   latest    94c80f09fdf3   7 seconds ago   611MB
```

### After
```bash
$ docker images
REPOSITORY               TAG       IMAGE ID       CREATED          SIZE
spring-example-project   latest    4418847e10ab   24 seconds ago   123MB
```

Applying the learned tricks to the spring-example-project brings the size down to a fifth of the original.

#### **`Dockerfile.before`**
```Dockerfile
FROM openjdk:8

EXPOSE 8080

WORKDIR /usr/src/app

COPY . .

RUN ./mvnw package

CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
```

#### **`Dockerfile.after`**
```Dockerfile
FROM openjdk:8 as build

WORKDIR /usr/src/app

COPY . .

RUN ./mvnw package

FROM openjdk:8-alpine

WORKDIR /usr/src/app

EXPOSE 8080

COPY --from=build /usr/src/app/target/docker-example-1.1.3.jar target/docker-example-1.1.3.jar

RUN adduser -D appuser

USER appuser

CMD ["java", "-jar", "./target/docker-example-1.1.3.jar"]
```
