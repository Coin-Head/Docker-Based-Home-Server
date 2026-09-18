# ntfy

- Navigate to the directory where you store all your Docker containers. For example, `~/docker-containers`.
- Create a new directory named `ntfy`. Inside it, create two files named `compose.yaml` and `.env`.

  ```text
  ~/docker-containers
    |
    └── ntfy
        ├── compose.yaml
        └── .env
  ```

- Copy the contents of the provided [`compose.yaml`](compose.yaml) and [`.env`](.env) into their respective files. Refer to the [official docs](https://docs.ntfy.sh/)
  
- Edit the `.env` file to your requirements. Refer [this](https://docs.ntfy.sh/config/#config-generator)
  
- Deploy ntfy by running:

  ```
  sudo docker compose up -d
  ```

- Once the container is running, open the following URL in your browser to access the ntfy dashboard:

  ```
  http://<server-ip>:2586
  ```
