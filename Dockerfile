# Base image
FROM node:alpine

# Base dependencies
RUN apk add --no-cache \
  curl

# Redis Commander
RUN npm install -g redis-commander

# Expose ports
EXPOSE 8081

# Healthcheck
ADD ./docker-healthcheck.sh /usr/local/bin/docker-healthcheck
RUN chmod +x /usr/local/bin/docker-healthcheck
HEALTHCHECK CMD docker-healthcheck

# Startup
ADD ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint
RUN chmod +x /usr/local/bin/docker-entrypoint
ENTRYPOINT ["docker-entrypoint"]
