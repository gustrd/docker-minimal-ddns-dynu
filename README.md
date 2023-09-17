# docker-minimal-ddns-dynu
Code to a very simple docker container that allows DYNU's DDNS updates.

This is configured to use IPv6 addresses. You need to enable IPv6 at docker with: https://docs.docker.com/config/daemon/ipv6/ to create the ip6net.

To build:
```
docker build -t docker-minimal-ddns-dynu .
```

To run:
```
docker run -d --name ddns-dynu --restart on-failure --network ip6net --env DYNU_HOSTNAME=my-hostname --env DYNU_PASSWORD=my-password docker-minimal-ddns-dynu
```

As an alternative to just run the script as a linux service, without the container, you can use:
```
sudo chmod +x ./install-service-alt.sh
sudo ./install-service-alt.sh my-hostname my-password
```
