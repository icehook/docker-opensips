# docker-opensips

### Basic OpenSIPS 2.2.x Docker Image

*Most standard OpenSIPS modules are included*

### Basic Setup
```
# Make the directory that contains you configs that we are going to mount
> mkdir -p /docker/data/opensips/etc/opensips

# Copy over your opensips.cfg
> cp opensips.cfg /docker/data/opensips/etc/opensips/opensips.cfg

# Run with docker-compose
> docker-compose -f opensips-compose.yml -p opensips up
```

### Building
```
> git clone git@github.com:icehook/docker-opensips.git
> cd docker-opensips
> docker build -t docker-opensips .
```

### Logging

Logs should be found under /docker/data/opensips/var/log/persistent

Remote Syslog logging can be configured by adding a RSYSLOG_REMOTE_SERVER ENV variable
