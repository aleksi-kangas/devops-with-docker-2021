# Exercise 1 - 05

```bash
$ docker pull devopsdockeruh/simple-web-service:ubuntu
ubuntu: Pulling from devopsdockeruh/simple-web-service
5d3b2c2d21bb: Pull complete
3fc2062ea667: Pull complete
75adf526d75b: Pull complete
965d4bbb586a: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:d44e1dce398732e18c7c2bad9416a072f719af33498302b02929d4c112e88d2a
Status: Downloaded newer image for devopsdockeruh/simple-web-service:ubuntu
docker.io/devopsdockeruh/simple-web-service:ubuntu
```

```bash
$ docker pull devopsdockeruh/simple-web-service:alpine
alpine: Pulling from devopsdockeruh/simple-web-service
ba3557a56b15: Pull complete
1dace236434b: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:dd4d367476f86b7d7579d3379fe446ae5dfce25480903fb0966fc2e5257e0543
Status: Downloaded newer image for devopsdockeruh/simple-web-service:alpine
docker.io/devopsdockeruh/simple-web-service:alpine
```

```bash
$ docker images
REPOSITORY                          TAG       IMAGE ID       CREATED        SIZE
devopsdockeruh/simple-web-service   ubuntu    4e3362e907d5   8 months ago   83MB
devopsdockeruh/simple-web-service   alpine    fd312adc88e0   8 months ago   15.7MB
```

```bash
$ docker run -d --name logger devopsdockeruh/simple-web-service:alpine
4d7af0ba56d82e926f5f78a125c40beb5a587fb059c2408266abb768b62c8bf2
```

```bash
$ docker exec -it logger sh
/usr/src/app # tail -f ./text.log
2021-11-10 20:10:56 +0000 UTC
2021-11-10 20:10:58 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2021-11-10 20:11:00 +0000 UTC
2021-11-10 20:11:02 +0000 UTC
2021-11-10 20:11:04 +0000 UTC
2021-11-10 20:11:06 +0000 UTC
2021-11-10 20:11:08 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2021-11-10 20:11:10 +0000 UTC
2021-11-10 20:11:12 +0000 UTC
^C
/usr/src/app #
```
