FROM nginx:1.15.9
MAINTAINER "European Environment Agency (EEA): IDM2 A-Team" <eea-edw-a-team-alerts@googlegroups.com>

RUN apt-get update && \
    apt-get install -y curl iputils-ping net-tools netcat && \
    curl https://raw.githubusercontent.com/eea/eea.docker.graylog-sender/master/docker-entrypoint.sh > test.sh &&\
    chmod 755 test.sh    


ENV GRAYLOG_INPUTS_LIST="gelf;tcp;localhost;12201 gelf;udp;localhost;12201 syslog;tcp;localhost;1514 syslog;udp;localhost;1514"

COPY nginx.conf.template /tmp/nginx.conf.template
COPY docker-start.sh /docker-start.sh

ENTRYPOINT ["/docker-start.sh"]

CMD ["nginx","-g","daemon off;"]
