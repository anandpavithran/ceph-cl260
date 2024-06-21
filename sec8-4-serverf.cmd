cephadm shell -- radosgw-admin realm pull --url=http://serverc:80 --access-key=replication --secret-key=secret
cephadm shell -- radosgw-admin period pull --url=http://serverc:80 --access-key=replication --secret-key=secret
cephadm shell -- radosgw-admin period get-current radosgw-admin 
cephadm shell -- radosgw-admin realm default --rgw-realm=cl260
cephadm shell -- radosgw-admin zonegroup default --rgw-zonegroup=classroom
cephadm shell -- radosgw-admin zone create --rgw-zonegroup=classroom --rgw-zone=us-east-2 --endpoints=http://serverf:80 --access-key=replication --secret-key=secret --default
cephadm shell -- radosgw-admin period update --commit --rgw-zone=us-east-2
cephadm shell -- ceph config set client.rgw rgw_zone us-east-2
cephadm shell -- ceph orch apply rgw cl260-2 --realm=cl260 --zone=us-east-2 --placement="1 serverf.lab.example.com"
cephadm shell -- radosgw-admin period get-current
cephadm shell -- radosgw-admin sync status
