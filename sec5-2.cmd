cephadm shell -- ceph health
cephadm shell -- ceph osd crush class ls
cephadm shell -- ceph osd crush tree
cephadm shell -- ceph osd crush rule create-replicated onssd default host ssd
cephadm shell -- ceph osd crush rule ls
cephadm shell -- ceph osd pool create myfast 32 32 onssd
cephadm shell -- ceph osd lspools
cephadm shell -- ceph pg dump pgs_brief
cephadm shell -- ceph osd crush add-bucket default-cl260 root
cephadm shell -- ceph osd crush add-bucket rack1 rack
cephadm shell -- ceph osd crush add-bucket hostc host
cephadm shell -- ceph osd crush add-bucket rack2 rack
cephadm shell -- ceph osd crush add-bucket hostd host
cephadm shell -- ceph osd crush add-bucket rack3 rack
cephadm shell -- ceph osd crush add-bucket hoste host
cephadm shell -- ceph osd crush move rack1 root=default-cl260
cephadm shell -- ceph osd crush move hostc rack=rack1
cephadm shell -- ceph osd crush move rack2 root=default-cl260
cephadm shell -- ceph osd crush move hostd rack=rack2
cephadm shell -- ceph osd crush move rack3 root=default-cl260
cephadm shell -- ceph osd crush move hoste rack=rack3
cephadm shell -- ceph osd crush tree
cephadm shell -- ceph osd crush set osd.1 1.0 root=default-cl260 rack=rack1 host=hostc
cephadm shell -- ceph osd crush set osd.5 1.0 root=default-cl260 rack=rack1 host=hostc
cephadm shell -- ceph osd crush set osd.6 1.0 root=default-cl260 rack=rack1 host=hostc
cephadm shell -- ceph osd crush set osd.0 1.0 root=default-cl260 rack=rack2 host=hostd
cephadm shell -- ceph osd crush set osd.3 1.0 root=default-cl260 rack=rack2 host=hostd
cephadm shell -- ceph osd crush set osd.4 1.0 root=default-cl260 rack=rack2 host=hostd
cephadm shell -- ceph osd crush set osd.2 1.0 root=default-cl260 rack=rack3 host=hoste
cephadm shell -- ceph osd crush set osd.7 1.0 root=default-cl260 rack=rack3 host=hoste
cephadm shell -- ceph osd crush set osd.8 1.0 root=default-cl260 rack=rack3 host=hoste
cephadm shell -- ceph osd crush tree
#STEP 4.1 onwards
