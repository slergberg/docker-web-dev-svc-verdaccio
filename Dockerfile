# Base image
FROM verdaccio/verdaccio

# User
USER root

# Base dependencies
RUN apk add --no-cache \
  curl

# Expose ports
EXPOSE 4873

# Healthcheck
ADD ./docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck
HEALTHCHECK CMD docker-healthcheck

# User
USER ${VERDACCIO_USER_UID}
