
export CEPH_ARGS='--id=rbd.clientb'
rbd map --pool rbd image1@firstsnap
rbd showmapped
blockdev --getro /dev/rbd0
#got to clienta
mount /dev/rbd0 /mnt/snapshot/
df /mnt/snapshot
ls -l /mnt/snapshot
umount /mnt/snapshot
rbd unmap --pool rbd image1@firstsnap
rbd showmapped
#go to clientA
rbd map --pool rbd clone1
mount /dev/rbd0 /mnt/clone
ls -l /mnt/clone
dd if=/dev/zero of=/mnt/clone/file1 bs=1M count=10
#clean up put enter
umount /mnt/clone
rbd unmap --pool rbd clone1
rbd showmapped
unset CEPH_ARGS
