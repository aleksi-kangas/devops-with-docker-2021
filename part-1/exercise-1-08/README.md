# Exercise 1 - 08

#### **`Dockerfile`**
```Dockerfile
FROM ubuntu:18.04

WORKDIR /usr/src/app

COPY script.sh .

RUN chmod +x script.sh

RUN apt-get update && apt-get install curl -y

CMD ./script.sh
```

#### **`script.sh`**
```bash
#!/bin/bash
echo "Input website:";
read website;
echo "Searching..";
sleep 1;
curl http://$website;
```

```bash
$ docker build . -t curler
[+] Building 19.0s (10/10) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                                                   0.0s
 => => transferring dockerfile: 191B                                                                                                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/library/ubuntu:18.04                                                                                                                                                                        6.7s
 => [internal] load build context                                                                                                                                                                                                      0.0s
 => => transferring context: 125B                                                                                                                                                                                                      0.0s
 => [1/5] FROM docker.io/library/ubuntu:18.04@sha256:0fedbd5bd9fb72089c7bbca476949e10593cebed9b1fb9edf5b79dbbacddd7d6                                                                                                                  2.5s
 => => resolve docker.io/library/ubuntu:18.04@sha256:0fedbd5bd9fb72089c7bbca476949e10593cebed9b1fb9edf5b79dbbacddd7d6                                                                                                                  0.0s
 => => sha256:fc0d6af5ab38dab33aa53643c4c4b312c6cd1f044c1a2229b2743b252b9689fc 529B / 529B                                                                                                                                             0.0s
 => => sha256:5a214d77f5d747e6ed81632310baa6190301feeb875cf6bf9da560108fa09972 1.46kB / 1.46kB                                                                                                                                         0.0s
 => => sha256:284055322776031bac33723839acb0db2d063a525ba4fa1fd268a831c7553b26 26.71MB / 26.71MB                                                                                                                                       1.1s
 => => sha256:0fedbd5bd9fb72089c7bbca476949e10593cebed9b1fb9edf5b79dbbacddd7d6 1.41kB / 1.41kB                                                                                                                                         0.0s
 => => extracting sha256:284055322776031bac33723839acb0db2d063a525ba4fa1fd268a831c7553b26                                                                                                                                              1.3s
 => [2/5] WORKDIR /usr/src/app                                                                                                                                                                                                         0.1s
 => [3/5] COPY script.sh .                                                                                                                                                                                                             0.0s
 => [4/5] RUN chmod +x script.sh                                                                                                                                                                                                       0.4s
 => [5/5] RUN apt-get update && apt-get install curl -y                                                                                                                                                                                8.8s
 => exporting to image                                                                                                                                                                                                                 0.3s
 => => exporting layers                                                                                                                                                                                                                0.3s
 => => writing image sha256:b8f6363acf17d12160d10d64ccf8f2cd43c0b609c4c0faf0b5467c80bf2f0d9d                                                                                                                                           0.0s
 => => naming to docker.io/library/curler                                                                                                                                                                                              0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

```bash
$ docker run -it curler
Input website:
helsinki.fi
Searching..
<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">
<html><head>
<title>301 Moved Permanently</title>
</head><body>
<h1>Moved Permanently</h1>
<p>The document has moved <a href="https://www.helsinki.fi/">here</a>.</p>
</body></html>
```
