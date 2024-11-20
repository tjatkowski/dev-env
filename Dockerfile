FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Fix certificates and package manager
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update --fix-missing && \
    apt-get install -y ca-certificates && \
    update-ca-certificates

# Essential tools
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    vim \
    wget \
    zsh \
    && rm -rf /var/lib/apt/lists/*

# Node.js and npm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
ENV NODE_VERSION=22
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"

# Python
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

# Ruby
RUN apt-get update && apt-get install -y \
    ruby \
    ruby-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /workspace

# Keep container running
CMD ["tail", "-f", "/dev/null"] 