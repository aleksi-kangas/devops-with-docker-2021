# Exercise 3 - 04

### Before
```bash
$ docker images
REPOSITORY         TAG       IMAGE ID       CREATED          SIZE
example-frontend   latest    ec3a127b554b   14 minutes ago   1.17GB
example-backend    latest    60e7cab48464   14 minutes ago   1.07GB
```

### After
```bash
$ docker images
REPOSITORY         TAG       IMAGE ID       CREATED          SIZE
example-frontend   latest    4eef92498969   58 seconds ago   1.17GB
example-backend    latest    47a00b1c76ca   2 minutes ago    1.07GB
```

No real benefit from purging apt, removing apt lists and combining RUN-commands.

#### **`example-backend/Dockerfile.before`**
```Dockerfile
FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/src/app

COPY . .

ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build

RUN useradd -m appuser
USER appuser

CMD ./server
```

#### **`example-backend/Dockerfile.after`**
```Dockerfile
FROM golang:1.16

EXPOSE 8080

WORKDIR /usr/src/app

COPY . .

ENV REQUEST_ORIGIN=http://localhost:5000

RUN go build && \
    apt autoremove --purge && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m appuser

USER appuser

CMD ./server
```

#### **`example-frontend/Dockerfile.before`**
```Dockerfile
FROM node:14

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install

RUN npm run build

RUN npm install -g serve

RUN useradd -m appuser
USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
```

#### **`example-frontend/Dockerfile.after`**
```Dockerfile
FROM node:14

EXPOSE 5000

WORKDIR /usr/src/app

COPY . .

ENV REACT_APP_BACKEND_URL=http://localhost:8080

RUN npm install && \
    npm run build && \
    npm install -g serve && \
    apt autoremove --purge && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m appuser

USER appuser

CMD ["serve", "-s", "-l", "5000", "build"]
```
