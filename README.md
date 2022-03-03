# Ngrok & Freenom

This addon creates a Ngrok tunnel to your Home Assistant instance and forwards your Freenom domain to the tunnel endpoint so you don't have to worry about changing tunnel domains.

## Configuration

1. Create a free account at [ngrok](https://dashboard.ngrok.com/get-started/setup) and enter your authentication token to the add-on config.

2. Register a free domain at [freenom](https://www.freenom.com/de/index.html) and enter your username, password and domain name to the add-on config.

3. Lastly you can change the address of your Home Assistant instance if needed.

4. Ensure you have the following in your `config.yaml`:
```yaml
http:
  ip_ban_enabled: true
  login_attempts_threshold: 5
  use_x_forwarded_for: true
  trusted_proxies:
    - 127.0.0.1
    - ::1
    - 172.16.0.0/12
```

You're ready to go!
