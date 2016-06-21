#!/bin/sh

cp /tmp/nginx.conf.template /etc/nginx/nginx.conf

GRAYLOG_HOSTS=${GRAYLOG_HOSTS:=graylog-master,graylog-client-1}

GRAYLOGSERVERSUDP=""
GRAYLOGSERVERSTCP=""

for service in $(echo $GRAYLOG_HOSTS | sed 's/ //g' | sed 's/,/\n/g'); do
    GRAYLOGSERVERSUDP=$GRAYLOGSERVERSUDP"\tserver $service:12201;\n"
    GRAYLOGSERVERSTCP=$GRAYLOGSERVERSTCP"\tserver $service:1514;\n"
done
sed -i 's/GRAYLOGSERVERSUDP/'"$GRAYLOGSERVERSUDP"'/g;s/GRAYLOGSERVERSTCP/'"$GRAYLOGSERVERSTCP"'/g' /etc/nginx/nginx.conf
