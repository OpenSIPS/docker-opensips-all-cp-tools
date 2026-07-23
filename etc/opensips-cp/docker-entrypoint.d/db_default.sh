#!/bin/bash

echo "Provisioning default data ..."

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e "
INSERT INTO rtpengine (socket, set_id)
SELECT 'udp:${RTPENGINE_IP}:${RTPENGINE_PORT}', 0
WHERE NOT EXISTS (
    SELECT 1 FROM rtpengine WHERE socket = 'udp:${RTPENGINE_IP}:${RTPENGINE_PORT}'
);"

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e "
INSERT INTO rtpproxy_sockets (rtpproxy_sock, set_id)
SELECT 'udp:${RTPPROXY_IP}:${RTPPROXY_PORT}', 0
WHERE NOT EXISTS (
    SELECT 1 FROM rtpproxy_sockets WHERE rtpproxy_sock = 'udp:${RTPPROXY_IP}:${RTPPROXY_PORT}'
);"

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e "
INSERT INTO domain (domain)
SELECT '${DEFAULT_DOMAIN}'
WHERE NOT EXISTS (
    SELECT 1 FROM domain WHERE domain = '${DEFAULT_DOMAIN}'
);"

mysql -h ${MYSQL_IP} -u ${MYSQL_USER} -p"${MYSQL_PASSWORD}" -D ${MYSQL_DATABASE} -e "
INSERT INTO clusterer (cluster_id, node_id, url, state, no_ping_retries, priority, sip_addr, flags, description)
SELECT 1, 1, 'bin:${OPENSIPS_IP}:5566', 1, 3, 50, '${OPENSIPS_IP}:5060', '', 'OpenSIPS CP Clusterer Node 1'
WHERE NOT EXISTS (
    SELECT 1 FROM clusterer WHERE cluster_id = 1 AND node_id = 1
);"
