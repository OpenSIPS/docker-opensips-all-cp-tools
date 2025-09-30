FROM opensips/opensips-cp:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    vim \
    nano \
    net-tools \
    sngrep \
    default-mysql-client \
    default-libmysqlclient-dev \
    build-essential \
    iproute2 \
    iputils-ping \
    telnet \
    git \
    python3 python3-pip python3-dev \
    python3-setuptools python3-wheel \
    netcat-traditional \
    tcpdump \
    strace \
    lsof \
    gettext-base \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
