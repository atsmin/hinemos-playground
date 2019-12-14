FROM centos/systemd

ENV HINEMOS_MAJOR 6.2
ENV HINEMOS_MINOR 2

RUN yum -y update \
    && yum -y install java-1.8.0-openjdk vim-common \
    && yum clean all

RUN rpm -ivh https://github.com/hinemos/hinemos/releases/download/v${HINEMOS_MAJOR}.${HINEMOS_MINOR}/hinemos-${HINEMOS_MAJOR}-manager-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.el7.x86_64.rpm \
    && systemctl enable hinemos_manager

EXPOSE 8080
EXPOSE 8081
EXPOSE 8082
EXPOSE 514

CMD ["/usr/sbin/init"]
