# Exercise 2 - 07

#### **`docker-compose.yml`**
```yaml
version: "3.9"

services:
  training:
    image: ml-training
    build: ./ml-kurkkumopo-training
    volumes:
      - ./model:/src/model
      - ./images:/src/imgs
  backend:
    image: ml-backend
    build: ./ml-kurkkumopo-backend
    volumes:
      - ./model:/src/model
    ports:
      - "5000:5000"
  frontend:
    image: ml-frontend
    build: ./ml-kurkkumopo-frontend
    ports:
      - "3000:3000"
```
