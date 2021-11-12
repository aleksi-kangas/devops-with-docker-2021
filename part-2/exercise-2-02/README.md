# Exercise 2 - 02

#### **`docker-compose.yml`**
```yaml
version: "3.9"

services:
  simple-web-service:
    image: devopsdockeruh/simple-web-service
    ports:
      - "8080:8080"
    command: server
    container_name: simple-web-service
```
