# Dockge

- Navigate to the directory where you store all your Docker containers. For example, `~/docker-containers`.
- Create a new directory named `dockge`. Inside it, create two files named `compose.yaml` and `.env`.

  ```text
  ~/docker-containers
    |
    └── dockge
        ├── compose.yaml
        └── .env
  ```

- Copy the contents of the provided [`compose.yaml`](compose.yaml) and [`.env`](.env) into their respective files. Refer to the [official docs](https://dockge.kuma.pet/)
- Edit the `.env` file and set the `STACKS_DIR` environment variable to the absolute path of your container directory. For example:

  ```env
  STACKS_DIR=/home/server/docker-containers
  ```

> [!NOTE]
> Use an **absolute path** for `STACKS_DIR`. Relative paths are **not supported**.

- Deploy Dockge by running:

  ```
  sudo docker compose up -d
  ```

- Once the container is running, open the following URL in your browser to access the Dockge dashboard:

  ```
  http://<server-ip>:5001
  ```
