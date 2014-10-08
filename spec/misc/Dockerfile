FROM rastasheep/ubuntu-sshd:14.04
MAINTAINER Uchio KONDO <udzura@udzura.jp>

ENV HOME /root

RUN apt-get -y install puppet
RUN apt-get -y install git

ADD dot.gitconfig /root/.gitconfig
ADD puppet_repo /var/repo/puppet
RUN git init /var/repo/puppet
RUN cd /var/repo/puppet && git add . && git commit -m 'sample commit'

RUN mkdir /root/.ssh
ADD id_dsa.pub /root/.ssh/authorized_keys
RUN chmod 700 /root/.ssh
RUN chmod 600 /root/.ssh/authorized_keys

RUN mkdir /var/puppet