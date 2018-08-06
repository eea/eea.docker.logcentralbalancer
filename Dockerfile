FROM nginx:1.15.2
MAINTAINER "European Environment Agency (EEA): IDM2 A-Team" <eea-edw-a-team-alerts@googlegroups.com>

COPY nginx.conf.template /tmp/nginx.conf.template
COPY docker-start.sh /docker-start.sh

CMD /docker-start.sh && nginx -g "daemon off;"
