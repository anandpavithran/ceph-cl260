#!/bin/bash
radosgw-admin realm pull --url=http://serverc:80 --access-key=replication --secret-key=secret
radosgw-admin period pull --url=http://serverc:80 --access-key=replication --secret-key=secret
radosgw-admin period get-current radosgw-admin 
realm default --rgw-realm=cl260
radosgw-admin zonegroup default --rgw-zonegroup=classroom
radosgw-admin zone create --rgw-zonegroup=classroom --rgw-zone=us-east-2 --endpoints=http://serverf:80 --access-key=replication --secret-key=secret --default
radosgw-admin period update --commit --rgw-zone=us-east-2
ceph config set client.rgw rgw_zone us-east-2
ceph orch apply rgw cl260-2 --realm=cl260 --zone=us-east-2 --placement="1 serverf.lab.example.com"
