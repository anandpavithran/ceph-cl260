cephadm shell -- ceph health
rbd map --pool rbd image1
mkfs.xfs /dev/rbd0
blockdev --getro /dev/rbd0
cephadm shell -- rbd snap create rbd/image1@firstsnap
cephadm shell -- rbd disk-usage --pool rbd image1
#go to clientb
mount /dev/rbd0 /mnt/image
mount | grep rbd
cp /etc/ceph/ceph.conf /mnt/image/file0
ls /mnt/image
df /mnt/image
#go to clientb
cephadm shell -- rbd snap protect rbd/image1@firstsnap
cephadm shell -- rbd clone rbd/image1@firstsnap rbd/clone1
cephadm shell -- rbd children rbd/image1@firstsnap
#go to clientb after completing put enter
#clean up put an enter
umount /mnt/image
rbd unmap --pool rbd image1
rbd showmapped
~                 

