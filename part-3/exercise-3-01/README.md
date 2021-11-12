# Exercise 3 - 01

#### **`build.yml`**
```yaml
name: Deploy to Heroku

on:
  push:
    branches:
      - master

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Login to Heroku Container Registry
        env:
          HEROKU_API_KEY: ${{ secrets.HEROKU_API_KEY }}
        run: heroku container:login
      - name: Push to Heroku Container Registry
        env:
          HEROKU_API_KEY: ${{ secrets.HEROKU_API_KEY }}
          HEROKU_APP_NAME: ${{ secrets.HEROKU_APP_NAME }}
        run: heroku container:push -a ${HEROKU_APP_NAME} web
      - name: Release Container in Heroku
        env:
          HEROKU_API_KEY: ${{ secrets.HEROKU_API_KEY }}
          HEROKU_APP_NAME: ${{ secrets.HEROKU_APP_NAME }}
        run: heroku container:release -a ${HEROKU_APP_NAME} web
```

```
https://github.com/aleksi-kangas/docker-hy.github.io
```

```
https://build-deploy-heroku.herokuapp.com/
```
