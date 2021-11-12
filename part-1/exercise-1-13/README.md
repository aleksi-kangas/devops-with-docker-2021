# Exercise 1 - 13

#### **`Dockerfile`**
```Dockerfile
FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/src/app

COPY . .

RUN go build

CMD ./server
```