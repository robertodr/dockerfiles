# dockerfiles

Collection of my Dockerfiles. The naming convention is: `Dockerfile.TAG`.

Build locally with:
```
docker build --tag TAG --file FILENAME .
```

## Travis CI

The images are built on Travis and uploaded to Docker Hub. Not all images are
built every time, only those whose Dockerfile changed. This is done as follows:

```
- CHANGED_FILES=($(git diff --name-only $TRAVIS_COMMIT_RANGE))
- >
  for file in $CHANGED_FILES; do
    if [[ $file =~ "Dockerfile" ]]; then
      dockerfile=$file
      image=${dockerfile#Dockerfile.}
      docker build --tag "$DOCKER_USERNAME"/$image --file $dockerfile .
      docker login --username "$DOCKER_USERNAME" --password-stdin "$DOCKER_PASSWORD"
      travis_wait 30 docker push "$DOCKER_USERNAME"/$image
    fi
  done
```
The _caveat_ is: **DO NOT** push changes to more than one Dockerfile at a
time if you don’t want Travis to choke!
