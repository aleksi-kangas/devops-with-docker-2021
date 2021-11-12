# Exercise 3 - 06

### Before
```bash
$ docker images
REPOSITORY         TAG       IMAGE ID       CREATED              SIZE
example-frontend   latest    b8e4354a0631   21 seconds ago       344MB
example-backend    latest    9f617c9f4979   About a minute ago   447MB
```

### After
```bash
$ docker images
REPOSITORY         TAG       IMAGE ID       CREATED              SIZE
example-frontend   latest    543c3f4d64a2   6 seconds ago        127MB
example-backend    latest    add087d5877c   About a minute ago   18.1MB
```

Multi-stage build brings the sizes down even more. The backend image is less than 25 MB, which was required.

#### **`example-backend/Dockerfile.before`**
```Dockerfile
FROM golang:1.16-alpine

EXPOSE 8080

WORKDIR /usr/src/app

COPY . .

ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build && \
    adduser -D appuser

USER appuser

CMD ./server
```

#### **`example-backend/Dockerfile.after`**
```Dockerfile
FROM golang:1.16-alpine AS build

WORKDIR /usr/src/app

COPY . .

RUN go build && adduser -D appuser


FROM scratch

WORKDIR /usr/src/app

EXPOSE 8080

ENV REQUEST_ORIGIN=http://localhost:5000

COPY --from=build /usr/src/app/server /usr/src/app

COPY --from=build /etc/passwd /etc/passwd
USER appuser

CMD ./server
```

#### **`example-frontend/Dockerfile.before`**
```Dockerfile
FROM node:14-alpine

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    adduser -D appuser

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
```

#### **`example-frontend/Dockerfile.after`**
```Dockerfile
FROM node:14 as build

WORKDIR /usr/src/app

COPY . .

RUN npm install && npm run build


FROM node:14-alpine

WORKDIR /usr/src/app

EXPOSE 5000

ENV REACT_APP_BACKEND_URL=http://localhost:8080

COPY --from=build /usr/src/app/build build

RUN npm install -g serve && adduser -D appuser

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
```
