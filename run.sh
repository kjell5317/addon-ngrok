#!/usr/bin/with-contenv bashio
set +u

CONFIG_PATH=/data/options.json

export ngrok_token=$(bashio::config 'ng_token')
export drache_addr=$(bashio::config 'drache.addr')
rm -f ngrok.yml temp.yml
( echo "cat <<EOF >ngrok.yml";
  cat template.yml;
  echo "EOF";
) >temp.yml
. temp.yml

bashio::log.info "Starting..."

ngrok start -config /ngrok.yml --all & \
    ./update.sh