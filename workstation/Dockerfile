FROM ubuntu:16.04
LABEL maintainer="training@chef.io"

WORKDIR /tmp

# Setup Chef Workstation
RUN apt-get update && apt-get install -y curl tree emacs nano vim jq ssh git sshpass
ADD https://packages.chef.io/files/stable/chef-workstation/0.1.119/ubuntu/16.04/chef-workstation_0.1.119-1_amd64.deb chef-workstation.deb
RUN dpkg -i chef-workstation.deb
RUN rm chef-workstation.deb
RUN mkdir -p /root/.chef-workstation
RUN touch /root/.chef-workstation/config.toml

WORKDIR /root

#Copy in recipe and cookbooks for learners to use
COPY recipe.rb recipe.rb
COPY webserver webserver/ 
COPY loadbalancer loadbalancer/ 

# Setup ssh-keys
RUN mkdir .ssh
COPY try-chef.key .ssh/
COPY ssh_config .ssh/config

# Setup ssh-agent to start on login, work around until chef-run reads ssh-config correctly.
COPY DOTbashrc .bashrc
RUN chmod u+x .bashrc
RUN chmod -R o-rwx .ssh/