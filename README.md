# docker-mysql-statsd
mysql-statsd dockerfile

This image only contains dependencies but does not automate any launching script.

To run mysql-statsd, simply docker run with the following command
docker run -d --name mysql_statsd \
  -v path-to-my-config-file:/etc/mysql-statsd/conf/mysql-statsd.conf \
  mysql_statsd

