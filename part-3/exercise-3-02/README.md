# Exercise 3 - 02

First build the image.

```bash
$ docker build . -t publisher
```

Running the built image will do the following:
1. Clone the given Git-repository.
2. Build and tag the image.
3. Login to Docker Hub with the given username and token.
4. Push the build image to Docker Hub.

Structure of the run command:

```bash
$ docker run -v /var/run/docker.sock:/var/run/docker.sock publisher \
  <git-repository-url> \
  <image-name> \
  <dockerhub-username> \
  <dockerhub-token>
```

Example:
```bash
$ docker run -v /var/run/docker.sock:/var/run/docker.sock publisher \
  https://github.com/docker-hy/docker-hy.github.io \
  course-material \
  aleksikangas \
  ********************
```
