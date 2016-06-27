#!/bin/sh

cp /tmp/nginx.conf.template /etc/nginx/nginx.conf

GRAYLOG_HOSTS=${GRAYLOG_HOSTS:=graylog-master,graylog-client-1}

GRAYLOGSERVERSGELF=""
GRAYLOGSERVERSSYSLOG=""

for service in $(echo $GRAYLOG_HOSTS | sed 's/ //g' | sed 's/,/\n/g'); do
    GRAYLOGSERVERSGELF=$GRAYLOGSERVERSGELF"\tserver $service:12201;\n"
    GRAYLOGSERVERSSYSLOG=$GRAYLOGSERVERSSYSLOG"\tserver $service:1514;\n"
done
sed -i 's/GRAYLOGSERVERSGELF/'"$GRAYLOGSERVERSGELF"'/g;s/GRAYLOGSERVERSSYSLOG/'"$GRAYLOGSERVERSSYSLOG"'/g' /etc/nginx/nginx.conf
