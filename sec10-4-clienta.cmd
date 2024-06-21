mkdir /mnt/mycephfs/dir1
touch /mnt/mycephfs/dir1/ddtest
getfattr -n ceph.dir.layout /mnt/mycephfs/dir1
setfattr -n ceph.dir.layout.stripe_count -v 2 /mnt/mycephfs/dir1
getfattr -n ceph.dir.layout /mnt/mycephfs/dir1
getfattr -n ceph.file.layout /mnt/mycephfs/dir1/ddtest
touch /mnt/mycephfs/dir1/anewfile
getfattr -n ceph.file.layout /mnt/mycephfs/dir1/anewfile
setfattr -n ceph.file.layout.stripe_count -v 3 /mnt/mycephfs/dir1/anewfile
getfattr -n ceph.file.layout /mnt/mycephfs/dir1/anewfile
echo "Not empty" > /mnt/mycephfs/dir1/anewfile
setfattr -n ceph.file.layout.stripe_count -v 4 /mnt/mycephfs/dir1/anewfile
setfattr -x ceph.dir.layout /mnt/mycephfs/dir1
touch /mnt/mycephfs/dir1/a3rdfile
getfattr -n ceph.file.layout /mnt/mycephfs/dir1/a3rdfile
umount /mnt/mycephfs
mount.ceph serverc.lab.example.com:/ /mnt/mycephfs -o name=restricteduser
cd /mnt/mycephfs/.snap
mkdir /mnt/mycephfs/.snap/mysnapshot
cephadm shell -- ceph auth get client.restricteduser
cephadm shell -- ceph auth caps client.restricteduser mds 'allow rws fsname=mycephfs' mon 'allow r fsname=mycephfs' osd 'allow rw tag cephfs data=mycephfs'
umount /mnt/mycephfs
mount.ceph serverc.lab.example.com:/ /mnt/mycephfs -o name=restricteduser
mkdir -p /mnt/mycephfs/.snap/mysnapshot
tree /mnt/mycephfs
tree /mnt/mycephfs/.snap/mysnapshot
cephadm shell -- ceph mgr module enable snap_schedule
cephadm shell -- ceph fs snap-schedule add / 1h
cephadm shell -- ceph fs snap-schedule status /
Wait------- and ls /mnt/mycephfs/.snap
