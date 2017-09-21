FROM centos:7
ARG VERSION=4.5.0.6
RUN curl http://turnserver.open-sys.org/downloads/v${VERSION}/turnserver-${VERSION}-CentOS7.2-x86_64.tar.gz | tar -xz  && \
    cd turnserver-${VERSION} && \
    yum update && \
    yum install hiredis && \
    yum install *.rpm

VOLUME /etc/turnserver/

ENV MIN_PORT=40000
ENV MAX_PORT=50000

EXPOSE 30000-60000/udp 3478/tcp 3478/udp

CMD ["/bin/bash", "-c", "/usr/local/bin/turnserver"]
