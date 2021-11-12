# Exercise 2 - 06

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
```
