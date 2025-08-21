FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV NODE_VERSION=22
ENV NEOVIM_VERSION=stable

# Install system dependencies and common tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    unzip \
    zip \
    jq \
    htop \
    tree \
    net-tools \
    iputils-ping \
    dnsutils \
    telnet \
    netcat-openbsd \
    vim \
    sudo \
    openssh-client \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (latest LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs

# Install Neovim (latest stable)
RUN curl -L https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz -o nvim-linux64.tar.gz \
    && tar -C /opt -xzf nvim-linux64.tar.gz \
    && ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim \
    && rm nvim-linux64.tar.gz

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# Install PowerShell
RUN wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y powershell \
    && rm -rf /var/lib/apt/lists/*

# Install Azure PowerShell module
RUN pwsh -Command "Install-Module -Name Az -Force -AllowClobber -Scope AllUsers"

# Install Claude Code
RUN curl -fsSL https://claude.ai/install.sh | bash

# Install LazyVim
RUN git clone https://github.com/LazyVim/starter /root/.config/nvim \
    && rm -rf /root/.config/nvim/.git

CMD ["/bin/bash"]