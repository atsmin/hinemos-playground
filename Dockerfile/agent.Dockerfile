FROM centos/systemd

ENV HINEMOS_MAJOR 6.2
ENV HINEMOS_MINOR 2

RUN yum -y update \
    && yum -y install java-1.8.0-openjdk net-snmp rsyslog \
    && yum clean all \
    && systemctl enable snmpd \
    && systemctl enable rsyslog

RUN HINEMOS_MANAGER=manager rpm -ivh https://github.com/hinemos/hinemos/releases/download/v${HINEMOS_MAJOR}.${HINEMOS_MINOR}/hinemos-${HINEMOS_MAJOR}-agent-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.el.noarch.rpm \
    && systemctl enable hinemos_agent

EXPOSE 161/udp
EXPOSE 24005/udp

CMD ["/usr/sbin/init"]
