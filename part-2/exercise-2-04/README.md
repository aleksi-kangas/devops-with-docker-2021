# Exercise 2 - 04

#### **`docker-compose.yml`**
```yaml
version: "3.9"

services:
  example-backend:
    image: example-backend
    build: ./example-backend
    ports:
      - "8080:8080"
    environment:
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
```
