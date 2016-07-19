FROM python:2.7-alpine

RUN apk add --no-cache --virtual .fetch-deps mariadb-dev py-mysqldb gcc musl-dev git

RUN mkdir  -p /var/log/mysql_statsd
VOLUME /var/log/mysql_statsd

RUN mkdir -p /etc/mysql-statsd/conf
VOLUME /etc/mysql-statsd/conf

# Install released version
#RUN pip install mysql_statsd

# Install development version
RUN mkdir -p /usr/src &&\
  cd /usr/src && \
  git clone https://github.com/db-art/mysql-statsd.git && \
  cd /usr/src/mysql-statsd && \
  pip install -r requirements.txt && \
  printf '#!/bin/sh\npython /usr/src/mysql-statsd/mysql_statsd/mysql_statsd.py -c /etc/mysql-statsd/conf/mysql-statsd.conf -f' > /usr/bin/mysql_statsd && \
  chmod 755 /usr/bin/mysql_statsd

CMD ["mysql_statsd"]

