#!/bin/bash

echo "Installing OpenSIPS database schema..."

cd "$(dirname "$0")"
. functions

TABLE_FILES=(
    acc-create.sql
    alias_db-create.sql
    auth_db-create.sql
    authjwt-create.sql
    b2b-create.sql
    b2b_sca-create.sql
    cachedb_sql-create.sql
    call_center-create.sql
    carrierroute-create.sql
    closeddial-create.sql
    clusterer-create.sql
    config-create.sql
    cpl-create.sql
    db-migrate.sql
    dialog-create.sql
    dialplan-create.sql
    dispatcher-create.sql
    domain-create.sql
    domainpolicy-create.sql
    drouting-create.sql
    emergency-create.sql
    fraud_detection-create.sql
    freeswitch_scripting-create.sql
    group-create.sql
    imc-create.sql
    load_balancer-create.sql
    msilo-create.sql
    permissions-create.sql
    presence-create.sql
    qrouting-create.sql
    ratecacher-create.sql
    registrant-create.sql
    rls-create.sql
    rtpengine-create.sql
    rtpproxy-create.sql
    smpp-create.sql
    sockets_mgm-create.sql
    speeddial-create.sql
    sqlops-create.sql
    table-migrate.sql
    tcp_mgm-create.sql
    tls_mgm-create.sql
    tracer-create.sql
    userblacklist-create.sql
    usrloc-create.sql
)

add_table /usr/share/opensips/mysql/standard-create.sql

for file in "${TABLE_FILES[@]}"; do
    add_table /usr/share/opensips/mysql/$file
done