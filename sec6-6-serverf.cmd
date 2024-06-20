cephadm shell -- ceph health
got clienta
cephadm shell -- ceph osd pool create rbd 32
cephadm shell -- ceph osd pool application enable rbd rbd
cephadm shell -- rbd pool init -p rbd
# got to clienta
another terminal in serverf sudo cephadm shell --mount /home/admin/rbd-import/
cephadm shell -- rbd --pool rbd ls
another terminal in serverf rbd import /mnt/export.dat rbd/test
cephadm shell -- rbd du --pool rbd test
rbd map --pool rbd test
mount /dev/rbd0 /mnt/rbd
mount | grep rbd
df -h /mnt/rbd
ls -l /mnt/rbd
cat /mnt/rbd/file0
umount /mnt/rbd
rbd unmap /dev/rbd0
got clienta
cephadm shell -- rbd snap create rbd/test@firstsnap
cephadm shell -- rbd du --pool rbd test
go to clienta
another terminal in serverf sudo cephadm shell --mount /home/admin/rbd-import/
cephadm shell -- rbd du --pool rbd test
another terminal in serverf rbd import-diff /mnt/rbd-import/export-diff.dat rbd/test
cephadm shell -- rbd du --pool rbd test
rbd map --pool rbd test
mount /dev/rbd0 /mnt/rbd
df /mnt/rbd
ls -l /mnt/rbd
umount /mnt/rbd
CLEAN UP 
go to clienta
rbd unmap /dev/rbd0
cephadm shell -- rbd --pool rbd snap purge test
cephadm shell -- rbd rm test --pool rbd

