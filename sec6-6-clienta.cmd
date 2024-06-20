cephadm shell -- ceph health
#goto serverf
cephadm shell -- ceph osd pool create rbd 32
cephadm shell -- ceph osd pool application enable rbd rbd
cephadm shell -- rbd pool init -p rbd
go to serverf
cephadm shell -- rbd create test --size 128 --pool rbd
rbd map --pool rbd test
mkfs.xfs /dev/rbd0
mount /dev/rbd0 /mnt/rbd
mount | grep rbd
cp /etc/ceph/ceph.conf /mnt/rbd/file0
ls /mnt/rbd
umount /mnt/rbd
another terminal clienta cephadm shell --mount /home/admin/rbd-export/
another terminal clienta rbd export rbd/test /mnt/export.dat
rsync -avP /home/admin/rbd-export/export.dat serverf:/home/admin/rbd-import
go to serverf
cephadm shell -- rbd snap create rbd/test@firstsnap
cephadm shell -- rbd du --pool rbd test
go to serverf
mount /dev/rbd0 /mnt/rbd
dd if=/dev/zero of=/mnt/rbd/file1 bs=1M count=5
ls -l /mnt/rbd/
umount /mnt/rbd
cephadm shell -- rbd du --pool rbd test
cephadm shell -- rbd snap create rbd/test@secondsnap
cephadm shell -- rbd du --pool rbd test
another terminal clienta cephadm shell --mount /home/admin/rbd-export/
another terminal clienta rbd export-diff --from-snap firstsnap rbd/test@secondsnap /mnt/export-diff.dat
rsync -avP /home/admin/rbd-export/export-diff.dat serverf:/home/admin/rbd-import
go to serverf
Clenaup
rbd unmap /dev/rbd0
cephadm shell -- rbd --pool rbd snap purge test
cephadm shell -- rbd rm test --pool rbd
go to serverf 
