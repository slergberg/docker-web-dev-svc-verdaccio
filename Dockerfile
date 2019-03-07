# Base image
FROM rediscommander/redis-commander

# User
USER root

# Base dependencies
RUN apk add --no-cache \
  curl

# Expose ports
EXPOSE 8081

# Healthcheck
ADD ./docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck
HEALTHCHECK CMD docker-healthcheck

# User
USER ${SERVICE_USER}
