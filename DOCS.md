# Ngrok & Freenom

## Deprecation Notice

There is [a new addon](https://github.com/brenner-tobias/addon-cloudflared) which has similar features but uses cloudflared so the domains are automaticly updated without cloaking which is a lot more comfortable. Pleas use cloudflared instead of this addon.

## Installation

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fkjell5317%2Faddon-ngrok)

Go to the add-on store of the supervisor and click on _repositories_ under the three dots.
Copy [_https://github.com/kjell5317/addon-ngrok_](https://github.com/kjell5317/addon-ngrok) into the field and add this repository.
Now you can install this add-on like any other home-assistant add-on.

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
