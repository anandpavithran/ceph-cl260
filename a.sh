#!/bin/bash
ceph osd crush add-bucket default-cl260 root
ceph osd crush add-bucket rack1 rack
ceph osd crush add-bucket hostc host
ceph osd crush add-bucket rack2 rack
ceph osd crush add-bucket hostd host
ceph osd crush add-bucket rack3 rack
ceph osd crush add-bucket hoste host
