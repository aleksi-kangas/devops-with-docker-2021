# Exercise 2 - 10

#### **`docker-compose.yml`**
```yaml
version: "3.9"

# The needed change was to modify the CORS policy of the backend.
# I overwrote the value of backend's environment variable REQUEST_ORIGIN in docker-compose.yml.
# Alternatively one could modify backend's Dockerfile and set it there.
# This solution avoids rebuilding backend's image.
# Changes made:
# - docker-compose.yml: Added "REQUEST_ORIGIN=http://localhost" to the backend's environment variables.
# - Dockerfile(s): None.
# - nginx.conf: None.

services:
  database:
    image: postgres
    ports:
      - "5432:5432"
    environment:
      - "POSTGRES_PASSWORD=postgres"
    volumes:
      - "./database:/var/lib/postgresql/data"
  example-backend:
    image: example-backend
    build: ./example-backend
    ports:
      - "8080:8080"
    environment:
      - "POSTGRES_HOST=database"
      - "POSTGRES_USER=postgres"
      - "POSTGRES_PASSWORD=postgres"
      - "POSTGRES_DATABASE=postgres"
      - "REDIS_HOST=redis"
      - "REQUEST_ORIGIN=http://localhost"   # Overwrite the Dockerfile's REQUEST_ORIGIN.
  example-frontend:
    image: example-frontend
    build: ./example-frontend
    ports:
      - "5000:5000"
  redis:
    image: redis
    ports:
      - "6379:6379"
  nginx-proxy:
    image: nginx
    volumes:
      - ./nginx.conf:/etc/nginx/nginx.conf
    ports:
      - "80:80"
```

#### **`nginx.conf`**
```nginx
events { worker_connections 1024; }

http {
  server {
    listen 80;

    location / {
      proxy_pass http://example-frontend:5000/;
    }

    location /api/ {
      proxy_set_header Host $host;
      proxy_pass http://example-backend:8080/;
    }
  }
}
```

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

#### **`nginx.conf`**
```nginx
events { worker_connections 1024; }

http {
  server {
    listen 80;

    location / {
      proxy_pass http://example-frontend:5000/;
    }

    location /api/ {
      proxy_set_header Host $host;
      proxy_pass http://example-backend:8080/;
    }
  }
}
```
