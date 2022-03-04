#!/usr/bin/with-contenv bashio
set +u

CONFIG_PATH=/data/options.json

user=$(bashio::config 'fn_user')
pwd=$(bashio::config 'fn_pwd')
domain=$(bashio::config 'fn_domain')

export ng_token=$(bashio::config 'ng_token')
export address=$(bashio::config 'address')
rm -f ngrok.yml temp.yml
( echo "cat <<EOF >ngrok.yml";
  cat template.yml;
  echo "EOF";
) >temp.yml
. temp.yml

chmod +x update.sh
bashio::log.info "Starting..."

ngrok start -config /ngrok.yml --all \
  & ./update.sh $user $pwd $domain
