FROM python:3-slim

# Install Tini as an Init-System
ENV TINI_VERSION="v0.19.0"
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN pip install -U \
    pip \
    setuptools \
    wheel

WORKDIR /data

RUN useradd -m -r user && \
    chown user /data

COPY requirements.txt ./
RUN pip install git+https://github.com/instaloader/instaloader.git

ARG GIT_HASH
ENV GIT_HASH=${GIT_HASH:-dev}

USER user

ENTRYPOINT ["/tini", "--"]
