#!/bin/bash

## Basic Setup
sudo apt-get update &
sudo apt-get upgrade -y &
sudo apt-get install -y software-properties-common curl git build-essential
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y curl git ansible build-essential
sudo apt-get clean autoclean
sudo apt-get autoremove --yes

## Install ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y curl git software-properties-common ansible

## Pull Ansible
sudo ansible-pull -U https://github.com/sarthikg/ansible.git