FROM opensips/opensips:3.3

# Install envsubst
# RUN apt-get update && apt-get install -y gettext-base && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y --no-install-recommends \
    vim \
    nano \
    net-tools \
    sngrep \
    default-mysql-client\
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
    gettext-base\   
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
 opensips-auth-modules\ 
 opensips-mysql-module\
 opensips-http-modules \
 && apt-get clean && rm -rf /var/lib/apt/lists/*


ENV OPENSIPS_EXTRA_MODULES="mi_http mi_fifo"

# RUN apt-get update && apt-get install -y opensips-auth-modules opensips-mysql-module opensips-mi-http


# # Install OpenSIPS CLI properly
# RUN pip3 install --upgrade pip setuptools wheel && \
# git clone https://github.com/OpenSIPS/opensips-cli.git /usr/local/src/opensips-cli && \
# cd /usr/local/src/opensips-cli && \
# pip3 install . && \
# cd / 