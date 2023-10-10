#!/bin/bash
ceph osd crush move rack1 root=default-cl260
ceph osd crush move hostc rack=rack1
ceph osd crush move rack2 root=default-cl260
ceph osd crush move hostd rack=rack2
ceph osd crush move rack3 root=default-cl260
ceph osd crush move hoste rack=rack3
