FROM centos:7

ENV HINEMOS_MAJOR 6.2
ENV HINEMOS_MINOR 2

RUN yum -y update \
    && yum -y install java-1.8.0-openjdk unzip vlgothic-p-fonts \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN localedef -c -i ja_JP -f UTF-8 ja_JP.UTF-8
ENV LANG ja_JP.UTF-8

RUN yum -y install https://github.com/hinemos/hinemos/releases/download/v${HINEMOS_MAJOR}.${HINEMOS_MINOR}/hinemos-${HINEMOS_MAJOR}-web-${HINEMOS_MAJOR}.${HINEMOS_MINOR}-1.el7.x86_64.rpm \
    && yum clean all \
    && rm -rf /var/cache/yum

EXPOSE 80

WORKDIR /opt/hinemos_web/bin

COPY web/run.sh .

CMD ["./run.sh"]

