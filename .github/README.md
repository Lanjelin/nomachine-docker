# NoMachine in Docker

Run [NoMachine](https://www.nomachine.com/) directly in your browser.  
Container built on [linuxserver/docker-baseimage-kasmvnc](https://github.com/linuxserver/docker-baseimage-kasmvnc), running the official linux release of NoMachine from their [download section](https://downloads.nomachine.com/linux/?id=1)  

## Application Setup

The application can be accessed at:

* http://yourhost:3000/
* https://yourhost:3001/

## Usage

Some snippets to get you started.

### docker-compose

```yaml
services:
  nomachine-docker:
    image: ghcr.io/lanjelin/nomachine-docker:latest
    container_name: nomachine
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Europe/Oslo
      - CUSTOM_USER=JohnDoe # optional, but recommended if exposing to -
      - PASSWORD=a-safe-pw  # the internet without any other form of authentication
    ports:
      - "3000:3000" #http
      - "3001:3001" #https
    volumes:
      - /path/to/config:/config
    restart: unless-stopped
```

### docker cli

```bash
docker run -d \
  --name=nomachine \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Oslo \
  -p 3000:3000 \
  -p 3001:3001 \
  -v /path/to/config:/config \
  --restart unless-stopped \
  ghcr.io/lanjelin/nomachine-docker:latest
```

Additional environment variables can be found [here](https://github.com/linuxserver/docker-baseimage-kasmvnc#options).
