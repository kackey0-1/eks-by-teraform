FROM amazonlinux:2

WORKDIR /usr/src/app
RUN mkdir /root/.aws
COPY ./credentials /root/.aws/

RUN yum -y update && yum -y install procps systemd-sysv
RUN yum -y install terraform awscli

CMD ["/sbin/init"]
