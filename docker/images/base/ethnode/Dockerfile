# Pull base image.
FROM ethereum/client-go

MAINTAINER Andrey Samokhvalov (andrew.shvv@gmail.com)

ENV APP_PATH "services/ethnode"
ENV DOCKER_PROJECT_PATH "/opt/deluge"

# Create and cd to the workdir
WORKDIR "$DOCKER_PROJECT_PATH"

# Add non-root user in order to run celery
RUN groupadd ethereum && useradd -g ethereum -m ethereum

# Create ethereum data dir
RUN mkdir -p "$APP_PATH"

# Change previlage
RUN chown ethereum "$APP_PATH"

# Create an ethereum data mount point
VOLUME ["$DOCKER_PROJECT_PATH/$APP_PATH"]

## Log in as ethereum user
#USER ethereum

WORKDIR "$DOCKER_PROJECT_PATH/$APP_PATH"

ENTRYPOINT ["geth"]
CMD ["--help"]
