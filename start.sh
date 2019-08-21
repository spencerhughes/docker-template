#!/bin/bash
usermod -u ${PUID} ${CONT_USER} > /dev/null 2>&1
groupmod -g ${PGID} ${CONT_USER} > /dev/null 2>&1
sed -i -e "s/\"AdminPassword\": \"DBA5E73E4EA26E377273\",/\"AdminPassword\": \"$ADMIN_PASSWORD\",/g" -e "s/\"StreamKey\": \"ALongStreamKey\",/\"StreamKey\": \"$STREAM_KEY\",/g" settings.json
su -s /bin/bash -c "${CONT_CMD}" ${CONT_USER}