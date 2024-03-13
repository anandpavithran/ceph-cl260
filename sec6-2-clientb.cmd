export CEPH_ARGS='--id=test_pool.clientb'
rbd ls test_pool
rbd create test_pool/test --size=128M
rbd ls test_pool
rbd info test_pool/test
rbd map test_pool/test
rbd showmapped
mkfs.xfs /dev/rbd0
mkdir /mnt/rbd
mount /dev/rbd0 /mnt/rbd
chown admin:admin /mnt/rbd
df /mnt/rbd
dd if=/dev/zero of=/mnt/rbd/test1 bs=10M count=1
ls /mnt/rbd
df /mnt/rbd
ceph df
umount /mnt/rbd
rbd unmap /dev/rbd0
rbd showmapped
echo "test_pool/test id=test_pool.clientb,keyring=/etc/ceph/ceph.client.test_pool.clientb.keyring" >> /etc/ceph/rbdmap
echo "/dev/rbd/test_pool/test /mnt/rbd xfs noauto 0 0" >> /etc/fstab
rbdmap map
rbd showmapped
rbd unmap /dev/rbd0
rbd showmapped
systemctl enable rbdmap
#other terminal try reboot#remove entry from fstab and rbdmap
umount /mnt/rbd
rbd rm test_pool/test --id test_pool.clientb
rados -p test_pool ls --id test_pool.clientb


