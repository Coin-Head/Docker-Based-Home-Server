# Overview
![preview](.docs/dashboard-overview.png)

TODO: talk about some 15+ services etc etc...

# Hardware Specs
| Components | Specifications |
| --- | --- |
| Motherboard | Gigabyte H270-Gaming 3 |
| CPU | Intel® Core™ i3-7100 Processor @ 3.90 GHz |
| GPU/Integrated GPU | Intel® HD Graphics 630  |
| Memory | 8GB DDR4 2400 Mhz |
| Network | 150 Mbps ↓ / 170 Mbps ↑ |
| *Storage | *Seagate BarraCuda 1TB HDD |

> [!IMPORTANT]
> It is recommended to swap out HDD for a SSD to install the OS into. You can use that HDD as a cold storage!
>
> If you want hardware transcoding for Jellyin and Immich, you need a GPU either integrated or dedicated.

# Prequisite
- Internet Connection
- Flashdrive. 8GB or more
- Ubunter Server ISO
- Another PC/Laptop
- (Optional but Recommended) Custom Domain

> [!NOTE]
> This guide uses reverse proxy (Caddy) to access apps since every accessible port is bind to localhost and can only be reached via custom domains.
>
> You can do this without custom domains, more on that later.

# Setting up the Server
- Download [Ubuntu Server](https://ubuntu.com/download/server) ISO
- Flash the ISO into the flashdrive using your favourite tool. I personally like balenaEtcher.
- Plug that flashdrive into your _old PC_ and boot from it by pressing the boot menu key. Depending on your motherboard your boot menu key may be different! For me its **F12**.
- Install Ubuntu Server. Make sure to select "install **OpenSSH Server**".

![openssh-server](.docs/openssh-server-overview.png)
OR
```
sudo apt update
sudo apt install openssh-server -y
sudo systemctl enable --now ssh
```

TODO: continue with
- static ip
- tailscale
- docker
- unattended-upgrades
- caddy
