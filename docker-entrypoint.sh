#!/usr/bin/env sh

cat > ${HOME}/.redis-commander <<EOF
{
  "sidebarWidth": 250,
  "locked": false,
  "CLIHeight": 50,
  "CLIOpen": false
}
EOF

if [[ ! -z "$REDIS_NAME" ]]; then
  sed -i "s/__LABEL__/$REDIS_NAME/g" ${HOME}/.redis-commander
else
  sed -i "s/__LABEL__/local/g" ${HOME}/.redis-commander
fi

if [[ ! -z "$REDIS_PORT" ]]; then
  set -- "$@" "--redis-port $REDIS_PORT"
  sed -i "s/__PORT__/$REDIS_PORT/g" ${HOME}/.redis-commander
else
  sed -i "s/__PORT__/6379/g" ${HOME}/.redis-commander
fi

if [[ ! -z "$REDIS_HOST" ]]; then
  set -- "$@" "--redis-host $REDIS_HOST"
  sed -i "s/__HOST__/$REDIS_HOST/g" ${HOME}/.redis-commander
else
  sed -i "s/__HOST__/localhost/g" ${HOME}/.redis-commander
fi

if [[ ! -z "$REDIS_SOCKET" ]]; then
  set -- "$@" "--redis-socket $REDIS_SOCKET"
fi

if [[ ! -z "$REDIS_PASSWORD" ]]; then
  set -- "$@" "--redis-password $REDIS_PASSWORD"
  sed -i "s/__PASSWORD__/$REDIS_PASSWORD/g" ${HOME}/.redis-commander
else
  sed -i "s/__PASSWORD__//g" ${HOME}/.redis-commander
fi

if [[ ! -z "$REDIS_DB" ]]; then
  set -- "$@" "--redis-db $REDIS_DB"
  sed -i "s/__DB_INDEX__/$REDIS_DB/g" ${HOME}/.redis-commander
else
  sed -i "s/__DB_INDEX__/0/g" ${HOME}/.redis-commander
fi

if [[ ! -z "$HTTP_USER" ]]; then
  set -- "$@" "--http-u $HTTP_USER"
fi

if [[ ! -z "$HTTP_PASSWORD" ]]; then
  set -- "$@" "--http-p $HTTP_PASSWORD"
fi

if [[ ! -z "$HTTP_PASSWORD_HASH" ]]; then
  set -- "$@" "--http-h $HTTP_PASSWORD_HASH"
fi

if [[ ! -z "$PORT" ]]; then
  set -- "$@" "--port $PORT"
fi

if [[ ! -z "$ADDRESS" ]]; then
  set -- "$@" "--address $ADDRESS"
fi

if [[ ! -z "$ROOT_PATTERN" ]]; then
  set -- "$@" "--root-pattern $ROOT_PATTERN"
fi

if [[ ! -z "$URL_PREFIX" ]]; then
  set -- "$@" "--url-prefix $URL_PREFIX"
fi

exec redis-commander $@
