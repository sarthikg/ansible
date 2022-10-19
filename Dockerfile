# Using Ubuntu 20.04
FROM ubuntu:focal AS base

# Changing the workdir for installing packages
WORKDIR /usr/local/bin

# To make the installations with zero-interaction (go with default answer to all questions)
ENV DEBIAN_FRONTEND=noninteractive

# Install basic packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common curl git build-essential && \
    apt-get install -y sudo && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y curl git ansible build-essential && \
    apt-get clean autoclean && \
    apt-get autoremove --yes

# Creating a multi-stage build
FROM base AS prime

# Accepting tags argument when building docker
ARG TAGS

# ARG USER=sarthikg

# Create a new group with a group-id of 1000
# RUN addgroup --gid 1000 sarthikg

# Create a new user named `sarthikg` under the group-id of 1000, with a user-id of 1000, and with no password.
RUN adduser --uid 1000 --disabled-password sarthikg
# RUN usermod -aG sudo sarthikg

# Switch to the user of `sarthikg`
USER sarthikg

# Change the work directory to the home of `sarthikg` user.
WORKDIR /home/sarthikg

# Creating a multi-stage build
FROM prime

# Copy the currents of the current directory into the containers's working directory
COPY . .

# Execute the ansible-playbook command
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml --ask-vault-pass"]
