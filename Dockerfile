FROM ubuntu:14.04
MAINTAINER "Langs" <chiang.langs@gmail.com>

# install git & curl & unzip & daemon
RUN apt-get -qq update && \
    apt-get install -q -y git curl unzip daemon
# setup localtime
RUN ln -sf /usr/share/zoneinfo/Asia/Hong_Kong /etc/localtime

RUN mkdir -p /usr/v2ray/
ADD install-release.sh /usr/v2ray/install-release.sh
ADD config.json /usr/v2ray/config.json
RUN chmod +x /usr/v2ray/install-release.sh
RUN bash /usr/v2ray/install-release.sh
ENTRYPOINT ["/usr/bin/v2ray/v2ray", "--config", "/etc/v2ray/config.json"]