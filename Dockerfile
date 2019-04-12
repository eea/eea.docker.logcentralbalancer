FROM nginx:1.15.9
MAINTAINER "European Environment Agency (EEA): IDM2 A-Team" <eea-edw-a-team-alerts@googlegroups.com>

COPY nginx.conf.template /tmp/nginx.conf.template
COPY docker-start.sh /docker-start.sh

ENTRYPOINT ["/docker-start.sh"]

CMD ["nginx","-g","daemon off;"]
