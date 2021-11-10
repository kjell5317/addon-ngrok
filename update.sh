#!/usr/bin/with-contenv bashio
set +u

sleep 5
domain1=$(curl -s 0.0.0.0:4040/api/tunnels | jq -r '.tunnels | .[0] | .public_url')
bashio::log.info "$domain1"

while true
do
    if domain2=$(curl -s 0.0.0.0:4040/api/tunnels | jq -r '.tunnels | .[0] | .public_url') \
        && [ "$domain1" != "$domain2" ]
    then
        domain1="$domain2"
        bashio::log.info "Changed domain to $domain2"
    fi
done
