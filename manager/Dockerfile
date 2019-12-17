FROM centos:7

ENV HINEMOS_MAJOR 6.2
ENV HINEMOS_MINOR 2

RUN yum -y update \
    && yum -y install java-1.8.0-openjdk vim-common net-snmp \
    && yum -y install https://github.com/hinemos/hinemos/releases/download/v${HINEMOS_MAJOR}.${HINEMOS_MINOR}/hinemos-${HINEMOS_MAJOR}-manager-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.el7.x86_64.rpm \
    && yum clean all \
    && rm -rf /var/cache/yum

VOLUME /opt/hinemos/var/data

EXPOSE 8080/tcp 8081/tcp 8082/tcp 514/tcp 514/udp 162/udp

WORKDIR /opt/hinemos/bin

COPY manager/run.sh .

CMD ["./run.sh"]

