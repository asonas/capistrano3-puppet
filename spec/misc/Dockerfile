FROM rastasheep/ubuntu-sshd:14.04

RUN apt-get -y install puppet
RUN apt-get -y install git

RUN mkdir /root/.ssh
ADD id_dsa.pub /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/authorized_keys

RUN mkdir /var/puppet