FROM debian:stretch-slim

ARG DEBIAN_FRONTEND=noninteractive

ENV PUID=1000
ENV PGID=1000

RUN apt-get -qq update && \
	apt-get -qq upgrade && \
	apt-get -qq install \
		git \
		curl \
		gnupg2 \
		apt-utils \
		apt-transport-https \
	&& \
	apt-get -qq autoremove && \
	apt-get -qq clean

COPY start.sh /

###############################################
#        EDIT TEMPLATE AFTER THIS LINE        #
###############################################

ENV CONT_USER=user
ENV CONT_CMD="sleep 1"

CMD ["/start.sh"]