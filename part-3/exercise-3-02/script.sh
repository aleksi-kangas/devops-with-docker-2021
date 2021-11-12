#!/bin/bash

if [ "$#" -lt 4 ]; then
  echo "Provide 4 arguments: 1) <git-repository-url> 2) <image-name> 3) <dockerhub-username> 4) <dockerhub-password>";
  exit 1;
fi;

GIT_REPOSITORY="$1"
IMAGE_NAME="$2"
DOCKERHUB_USERNAME="$3"
DOCKERHUB_TOKEN="$4"
TAG="latest"

mkdir repository
cd repository || exit
git clone "$GIT_REPOSITORY" .
docker build . -t "$DOCKERHUB_USERNAME/$IMAGE_NAME:$TAG"
echo "$DOCKERHUB_TOKEN" | docker login --username "$DOCKERHUB_USERNAME" --password-stdin "docker.io"
docker push "$DOCKERHUB_USERNAME/$IMAGE_NAME:$TAG"