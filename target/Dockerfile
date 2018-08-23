FROM ubuntu:16.04
LABEL maintainer="training@chef.io"

# Setup ssh-server and allow root login
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup ssh public key
RUN mkdir /root/.ssh
COPY try-chef.key.pub /root/.ssh/authorized_keys
RUN chmod -R o-rwx /root/.ssh/

# Run ssh-server on port 22
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
