cephadm shell -- ceph health
cephadm shell -- ceph osd pool create test_pool 32 32
cephadm shell -- rbd pool init test_pool
cephadm shell -- ceph df
cephadm shell -- ceph auth get-or-create client.test_pool.clientb mon 'profile rbd' osd 'profi le rbd' | sudo tee /etc/ceph/ceph.client.test_pool.clientb.keyring
cat /etc/ceph/ceph.client.test_pool.clientb.keyring
cephadm shell -- ceph auth get client.test_pool.clientb
ssh root@serverb "yum install -y ceph-common"
cephadm shell #scp ceph.conf test_pool keyring to clientb


