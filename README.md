# Ngrok

This addon creates Ngrok tunnels to your home-assistant instance. This version isn't fully working, so there is an issue where the addon thinks your URL changed because the ngrok CLI returns `http://` and `https://` links.
I also want cloudflare CNAME records to be updated with the new ngrok URL but I run into issues with the SSL certificate (obviously) and am now looking for an alternative.
