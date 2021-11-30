FROM python:3-slim

# Install Tini as an Init-System
RUN apt-get update && apt-get install -y git gpg
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
 && gpg --batch --verify /tini.asc /tini
RUN chmod +x /tini

RUN pip install -U \
    pip \
    setuptools \
    wheel

WORKDIR /data
RUN mkdir /config

RUN useradd -m -r user && \
    chown user /data && \
    chown user /config

RUN pip install git+https://github.com/instaloader/instaloader.git

COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    chown user /entrypoint.sh

ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH:-dev}

USER user

VOLUME /data

ENTRYPOINT ["/tini", "--", "/entrypoint.sh"]
