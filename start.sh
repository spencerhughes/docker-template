#!/bin/bash
usermod -u ${PUID} ${CONT_USER}
groupmod -g ${PGID} ${CONT_USER}
su -s /bin/bash -c "${CONT_CMD}" ${CONT_USER}