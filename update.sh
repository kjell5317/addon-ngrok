#!/usr/bin/with-contenv bashio
set +u

sleep 5
domain1="$(basename "$(curl -s 0.0.0.0:4040/api/tunnels | jq -r '.tunnels | .[0] | .public_url')")"
bashio::log.info "$domain1"
fdu domain forward "$1" "$2" "$3" -u "$domain1"

while true
do
    if domain2="$(basename "$(curl -s 0.0.0.0:4040/api/tunnels | jq -r '.tunnels | .[0] | .public_url')")" \
        && [ "$domain1" != "$domain2" ]
    then
        domain1="$domain2"
        bashio::log.info "Changed to $domain2"
        fdu domain forward "$1" "$2" "$3" -u "$domain1"
    fi
done
