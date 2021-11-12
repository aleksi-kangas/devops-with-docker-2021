# Exercise 1 - 03

```bash
$ docker run -d --name logger devopsdockeruh/simple-web-service:ubuntu
Unable to find image 'devopsdockeruh/simple-web-service:ubuntu' locally
ubuntu: Pulling from devopsdockeruh/simple-web-service
5d3b2c2d21bb: Pull complete
3fc2062ea667: Pull complete
75adf526d75b: Pull complete
965d4bbb586a: Pull complete
4f4fb700ef54: Pull complete
Digest: sha256:d44e1dce398732e18c7c2bad9416a072f719af33498302b02929d4c112e88d2a
Status: Downloaded newer image for devopsdockeruh/simple-web-service:ubuntu
cf6264079aad9ec99d73a6644ce3ebeccd5564b349cf1604f56723145ef5c16a
```

```bash
$ docker exec -it logger bash
root@cf6264079aad:/usr/src/app# tail -f ./text.log
2021-11-10 19:49:41 +0000 UTC
2021-11-10 19:49:43 +0000 UTC
2021-11-10 19:49:45 +0000 UTC
2021-11-10 19:49:47 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2021-11-10 19:49:49 +0000 UTC
2021-11-10 19:49:51 +0000 UTC
2021-11-10 19:49:53 +0000 UTC
2021-11-10 19:49:55 +0000 UTC
2021-11-10 19:49:57 +0000 UTC
Secret message is: 'You can find the source code here: https://github.com/docker-hy'
2021-11-10 19:49:59 +0000 UTC
2021-11-10 19:50:01 +0000 UTC
2021-11-10 19:50:03 +0000 UTC
2021-11-10 19:50:05 +0000 UTC
^C
root@cf6264079aad:/usr/src/app#
```
