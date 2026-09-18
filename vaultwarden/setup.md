# Vaultwarden

- Navigate to the directory where you store all your Docker containers. For example, `~/docker-containers`.
- Create a new directory named `vaultwarden`. Inside it, create two files named `compose.yaml` and `.env`.

  ```text
  ~/docker-containers
    |
    └── vaultwarden
        ├── compose.yaml
        └── .env
  ```

- Copy the contents of the provided [`compose.yaml`](compose.yaml) and [`.env`](.env) into their respective files. Refer to the [official docs](https://github.com/dani-garcia/vaultwarden)

> [!IMPORTANT]
> Vaultwarden needs a **HTTPS** connection to work properly and a **reverse proxy** is recommended.
  
- TODO: Write about getting a domain either from tailscale or duckdns. Search a little on this
  - 
  - 
  
- Deploy vaultwarden by running:

  ```
  sudo docker compose up -d
  ```

- Once the container is running, Use the following url in the chrome extension or mobile app to connect to your server.

  ```
  https://<domain.tld>
  ```
