# Exercise 2 - 03

#### **`docker-compose.yml`**
```yaml
version: "3.9"

services:
  example-backend:
    image: example-backend
    build: ./example-backend
    ports:
      - "8080:8080"
  example-frontend:
    image: example-frontend
    build: ./example-frontend
    ports:
      - "5000:5000"
```
