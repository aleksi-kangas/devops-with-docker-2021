# Exercise 2 - 01

#### **`docker-compose.yml`**
```yaml
version: "3.9"

services:
  logger:
    image: devopsdockeruh/simple-web-service
    volumes:
      - ./text.log:/usr/src/app/text.log
```
