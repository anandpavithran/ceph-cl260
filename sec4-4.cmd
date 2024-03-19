cephadm shell -- ceph health
cephadm shell -- ceph osd pool create replpool1 64 64 
cephadm shell -- ceph osd pool get replpool1 pg_autoscale_mode
cephadm shell -- ceph config get mon osd_pool_default_pg_autoscale_mode
cephadm shell -- ceph osd lspools
cephadm shell -- ceph osd pool autoscale-status
cephadm shell -- ceph osd pool set replpool1 size 4
cephadm shell -- ceph osd pool set replpool1 min_size 2
cephadm shell -- ceph osd pool application enable replpool1 rbd
cephadm shell -- ceph osd pool ls detail
cephadm shell -- ceph osd pool get replpool1 size
cephadm shell -- ceph osd pool rename replpool1 newpool
cephadm shell -- ceph osd pool delete newpool
cephadm shell -- ceph osd pool delete newpool newpool --yes-i-really-really-mean-it
cephadm shell -- ceph tell mon.* config set mon_allow_pool_delete true
cephadm shell -- ceph osd pool delete newpool newpool --yes-i-really-really-mean-it
cephadm shell -- ceph osd erasure-code-profile ls
cephadm shell -- ceph osd erasure-code-profile get default
cephadm shell -- ceph osd erasure-code-profile set ecprofile-k4-m2 k=4 m=2
cephadm shell -- ceph osd pool create ecpool1 64 64 erasure ecprofile-k4-m2 
cephadm shell -- ceph osd pool application enable ecpool1 rgw
cephadm shell -- ceph osd pool ls detail
cephadm shell -- ceph osd pool set ecpool1 allow_ec_overwrites true
cephadm shell -- ceph osd pool delete ecpool1 ecpool1 --yes-i-really-really-mean-it
