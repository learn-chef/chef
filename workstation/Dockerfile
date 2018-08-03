FROM ubuntu:16.04
LABEL maintainer="training@chef.io"

WORKDIR /tmp
RUN apt-get update && apt-get install -y curl tree emacs nano vim jq ssh git sshpass
ADD https://packages.chef.io/files/stable/chef-workstation/0.1.137/ubuntu/16.04/chef-workstation_0.1.137-1_amd64.deb chef-workstation.deb
RUN dpkg -i chef-workstation.deb
RUN rm chef-workstation.deb
RUN mkdir -p /root/.chef-workstation
RUN touch /root/.chef-workstation/config.toml
WORKDIR /root