#!/bin/bash
ceph osd crush set osd.1 1.0 root=default-cl260 rack=rack1 host=hostc
ceph osd crush set osd.5 1.0 root=default-cl260 rack=rack1 host=hostc
ceph osd crush set osd.6 1.0 root=default-cl260 rack=rack1 host=hostc
ceph osd crush set osd.0 1.0 root=default-cl260 rack=rack2 host=hostd
ceph osd crush set osd.3 1.0 root=default-cl260 rack=rack2 host=hostd
ceph osd crush set osd.4 1.0 root=default-cl260 rack=rack2 host=hostd
ceph osd crush set osd.2 1.0 root=default-cl260 rack=rack3 host=hoste
ceph osd crush set osd.7 1.0 root=default-cl260 rack=rack3 host=hoste
ceph osd crush set osd.8 1.0 root=default-cl260 rack=rack3 host=hoste
