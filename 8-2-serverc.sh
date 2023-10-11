#!/bin/bash
radosgw-admin realm create --rgw-realm=cl260 --default
radosgw-admin zonegroup create --rgw-zonegroup=classroom --endpoints=http://serverc:80 --master --default
radosgw-admin zone create --rgw-zonegroup=classroom --rgw-zone=us-east-1 --endpoints=http://serverc:80 --master --default --access-key=replication --secret=secret
radosgw-admin user create --uid="repl.user" --system --display-name="Replica tion User" --secret=secret --access-key=replication
radosgw-admin period update --commit
ceph orch apply rgw cl260-1 --realm=cl260 --zone=us-east-1 --placement="1 serverc.lab.example.com"
ceph config set client.rgw rgw_zone us-east-1

