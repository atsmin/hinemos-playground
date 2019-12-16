FROM centos:7

ENV HINEMOS_MAJOR 6.2
ENV HINEMOS_MINOR 2

RUN yum -y update \
    && yum -y install java-1.8.0-openjdk net-snmp rsyslog \
    && HINEMOS_MANAGER=manager yum -y install https://github.com/hinemos/hinemos/releases/download/v${HINEMOS_MAJOR}.${HINEMOS_MINOR}/hinemos-${HINEMOS_MAJOR}-agent-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.el.noarch.rpm \
    && yum clean all \
    && rm -rf /var/cache/yum

EXPOSE 161/udp 24005/udp

COPY agent/run.sh /opt/hinemos_agent/bin

CMD ["/opt/hinemos_agent/bin/run.sh"]

