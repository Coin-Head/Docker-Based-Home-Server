# Overview
![preview](.docs/dashboard-overview.png)

This guide is a step-by-step walkthrough about turning your old PC (that has been sitting in a corner doing absolutely *nothing*) into your very own netflix, a cloud storage/NAS, image backup server, and many more - with just a little *love*.

# Hardware Specifications
| Components | Specifications |
| --- | --- |
| Motherboard | Gigabyte H270-Gaming 3 |
| CPU | Intel® Core™ i3-7100 Processor @ 3.90 GHz |
| GPU/Integrated GPU | Intel® HD Graphics 630  |
| Memory | 8GB DDR4 2400 Mhz |
| Network | 150 Mbps ↓ / 170 Mbps ↑ |
| *Storage | *Seagate BarraCuda 1TB HDD |

> [!IMPORTANT]
> It is recommended to install the operating system on an SSD and use the HDD for cold storage.
>
> If you want hardware transcoding for Jellyfin and Immich, you'll need a GPU, either integrated or dedicated.

# Prequisite
- Internet Connection
- Flashdrive. 8GB or more
- Ubuntu Server ISO
- Another PC or Laptop
- (Optional but Recommended) Custom Domain

> [!NOTE]
> This guide uses a reverse proxy (Caddy) because every application is bound to localhost and is only accessible through custom domains.
>
> You can also follow this guide without a custom domain — more on that later.

# Setting up the Server
- Download [Ubuntu Server](https://ubuntu.com/download/server) ISO
- Flash the ISO to a USB drive using your preferred tool. I personally recommend balenaEtcher.
- Connect a monitor and keyboard to your PC (this isn't necessary if you're using a laptop).
- Insert the USB drive into your old PC and boot from it by pressing your motherboard's boot menu key. The key varies depending on the manufacturer—for my motherboard, it's **F12**.
- Install Ubuntu Server, make sure to select "install **OpenSSH Server**".

  ![openssh-server](.docs/openssh-server-overview.png)
  Or install it later
  ```
  sudo apt update
  sudo apt install openssh-server -y
  sudo systemctl enable --now ssh
  ```
- After the installation is complete, log in to the server.
- Assign the server a static IP address.
  
  Edit (or create) a Netplan configuration file, for example: <kbd>/etc/netplan/static.yaml</kbd>
  ```
  network:
  version: 2
  renderer: networkd
  ethernets:
    enp6s0:
      dhcp4: false
      addresses: [192.168.1.200/24]
      routes:
        - to: default
          via: 192.168.1.1
      nameservers:
        addresses: [1.1.1.1, 1.0.0.1]
  ```
  Then `sudo netplan apply`.

- Install Tailscale and add the server to your tailnet.
  ```
  curl -fsSL https://tailscale.com | sh
  sudo tailscale up
  ```
> [!NOTE]
> If you plan to use Pi-hole, disable Tailscale's DNS override by running:
>
> `sudo tailscale set --accept-dns=false`

- At this point, you can access your server remotely. Open a terminal on another computer that's connected to either your LAN or your tailnet and run: `ssh <username>@192.168.x.x` or `ssh <username>@100.x.x.x`

- Install Docker by following the official [Docker installation guide](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository). Also refer [here](https://docs.docker.com/engine/install/linux-postinstall/).
- Create a directory to store all your Docker containers. For example:
  
  ```
  ~/docker-containers
    |
    ├── immich
    |   ├── compose.yaml
    |   ├── .env
    |   └── config/
    |
    ├── mediaserver
    |   ├── compose.yaml
    |   ├── .env
    |   └── config/
    |
    | ...
  
  ```
- (*Optional*) Unattended Upgrades
- (*Optional but Recommended*) Caddy. I use Caddy with Porkbun DNS module. [link](https://caddyserver.com/docs/modules/dns.providers.porkbun)

> [!TIP]
> If you own a domain, create a wildcard DNS record that points to your server's Tailscale IP.
>
> You can also create separate subdomains for your tailnet and LAN. For example:
>
> **foo.domain.tld** → **Tailnet**<br>
> **foo.local.domain.tld** → **LAN**

# Applications

- [Dockge](#dockge)
- [ntfy](#ntfy)
- [vaultwarden](#vaultwarden)
- [Filebrowser/NAS](#filebrowser/nas)
- [Immich](#immich)
- TSDProxy
- Mediaserver
- Changedetection.io
- Beszel
- Aria2 + AriaNg
- Pihole
- Stirling PDF
- Uptime Kuma
- Watchtower
- Duplicati
- Cockpit
- Homarr

### Dockge
- Goto to your desired directory and copy these [files](dockge/)
