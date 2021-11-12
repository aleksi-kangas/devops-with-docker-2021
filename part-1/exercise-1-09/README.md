# Exercise 1 - 09

```bash
$ touch text.log
```

```bash
$ docker run -d -v "$(pwd)/text.log:/usr/src/app/text.log" devopsdockeruh/simple-web-service
Unable to find image 'devopsdockeruh/simple-web-service:latest' locally
latest: Pulling from devopsdockeruh/simple-web-service
cd2b813b068d: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:20282b20abae04beefa9637bb565943330ed5d085a22fcf8c4878abad80be712
Status: Downloaded newer image for devopsdockeruh/simple-web-service:latest
2d40675c6e8d323d7a1df567e0dbdfc6525bd90e08831e7b0451c2bc211612b2
```

```bash
$ docker ps
CONTAINER ID   IMAGE                               COMMAND                 CREATED         STATUS         PORTS     NAMES
2d40675c6e8d   devopsdockeruh/simple-web-service   "/usr/src/app/server"   6 seconds ago   Up 5 seconds             loving_rosalind
```

```bash
$ cat text.log
2021-11-12 07:21:55 +0000 UTC
2021-11-12 07:21:57 +0000 UTC
2021-11-12 07:21:59 +0000 UTC
2021-11-12 07:22:01 +0000 UTC
2021-11-12 07:22:03 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2021-11-12 07:22:05 +0000 UTC
```
