# Exercise 2 - 08

#### **`docker-compose.yml`**
```yaml
version: "3.9"

services:
  database:
    image: postgres
    ports:
      - "5432:5432"
    environment:
      - "POSTGRES_PASSWORD=postgres"
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
