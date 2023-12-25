FROM mcr.microsoft.com/azure-powershell:11.1.0-ubuntu-22.04

MAINTAINER Øystein Strœte <github@qbits.no>

ENV BICEP_VERSION=v0.24.24

RUN apt update

# Curl
RUN apt install -y curl

# Git
RUN apt install -y git

# Bicep
RUN curl -Lo bicep https://github.com/Azure/bicep/releases/download/${BICEP_VERSION}/bicep-linux-x64
RUN chmod +x ./bicep
RUN mv ./bicep /usr/local/bin/bicep

CMD pwsh
