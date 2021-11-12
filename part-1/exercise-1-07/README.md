# Exercise 1 - 07

#### **`Dockerfile`**
```Dockerfile
FROM devopsdockeruh/simple-web-service:ubuntu

CMD server
```

```bash
$ docker build . -t web-server
[+] Building 8.5s (6/6) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                                                   0.0s
 => => transferring dockerfile: 102B                                                                                                                                                                                                   0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                      0.0s
 => => transferring context: 2B                                                                                                                                                                                                        0.0s
 => [internal] load metadata for docker.io/devopsdockeruh/simple-web-service:ubuntu                                                                                                                                                    8.4s
 => [auth] devopsdockeruh/simple-web-service:pull token for registry-1.docker.io                                                                                                                                                       0.0s
 => CACHED [1/1] FROM docker.io/devopsdockeruh/simple-web-service:ubuntu@sha256:d44e1dce398732e18c7c2bad9416a072f719af33498302b02929d4c112e88d2a                                                                                       0.0s
 => => resolve docker.io/devopsdockeruh/simple-web-service:ubuntu@sha256:d44e1dce398732e18c7c2bad9416a072f719af33498302b02929d4c112e88d2a                                                                                              0.0s
 => exporting to image                                                                                                                                                                                                                 0.0s
 => => exporting layers                                                                                                                                                                                                                0.0s
 => => writing image sha256:de4d5f11c9938964734d96f350b99d1a339f9b7027d11b690aef5a7fe0a5b18a                                                                                                                                           0.0s
 => => naming to docker.io/library/web-server                                                                                                                                                                                          0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
```

```bash
$ docker run web-server
[GIN-debug] [WARNING] Creating an Engine instance with the Logger and Recovery middleware already attached.

[GIN-debug] [WARNING] Running in "debug" mode. Switch to "release" mode in production.
 - using env:   export GIN_MODE=release
 - using code:  gin.SetMode(gin.ReleaseMode)

[GIN-debug] GET    /*path                    --> server.Start.func1 (3 handlers)
[GIN-debug] Listening and serving HTTP on :8080
```
