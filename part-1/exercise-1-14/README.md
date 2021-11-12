# Exercise 1 - 14

#### **`example-backend/Dockerfile`**
```Dockerfile
FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/src/app

COPY . .

ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

CMD ./server
```

#### **`example-frontend/Dockerfile`**
```Dockerfile
FROM node:14

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install

RUN npm run build

RUN npm install -g serve

CMD ["serve", "-s", "-l", "5000", "build"]
```
