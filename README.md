# docker-movienight
Docker wrapper around (MovieNight)[https://github.com/zorchenhimer/MovieNight]
## Usage
```
docker run \
	-e STREAM_KEY="PASSWORD_FOR_OBS" \
	-e ADMIN_PASSWORD="PASSWORD_FOR_ADMIN_INTERFACE" \
	-e PUID="1000" \
	-e PGID="1000" \
	-p 8089:8089 \
	-p 1935:1935 \
	--name movienight \
	--restart unless-stopped \
	spencerhughes/movienight:latest
```
## Environment Variables
| STREAM_KEY | Sets the stream key for OBS |
| ADMIN_PASSWORD | Sets the admin password for the MovieNight web interface
| PUID | Sets the UID to execute MovieNight as |
| PGID | Sets the GID to execute MovieNight as |

## Ports
| 8089 | HTTP port for MovieNight frontent |
| 1935 | RTMP port for OBS stream |