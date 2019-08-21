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

WORKDIR /opt

RUN curl -O https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz && \
	tar -xzf go*.linux-amd64.tar.gz && \
	mv go /usr/local/

ENV GOROOT=/usr/local/go
ENV GOPATH=/opt
ENV PATH="$GOPATH/bin:$GOROOT/bin:${PATH}"
ENV STREAM_KEY="A1B2C3D4E5F6G7"
ENV ADMIN_PASSWORD="A1B2C3D4E5F6G7"

RUN apt-get -qq update && \
	apt-get -qq upgrade && \
	apt-get -qq install \
		make \
		gcc && \
	apt-get -qq autoremove && \
	apt-get -qq clean

RUN git clone https://github.com/zorchenhimer/MovieNight && \
	cd MovieNight && \
	make

ENV CONT_USER=movienight
ENV CONT_CMD="./MovieNight"
ENV CONT_USER_HOME="/opt"

WORKDIR /opt/MovieNight

###############################################
#        EDIT TEMPLATE BEFORE THIS LINE       #
###############################################

RUN useradd -d $CONT_USER_HOME $CONT_USER

RUN chown -R $CONT_USER /opt/MovieNight

RUN chmod +x /start.sh

CMD ["/start.sh"]