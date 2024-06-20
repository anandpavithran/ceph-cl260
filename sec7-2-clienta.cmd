cephadm shell -- ceph status
Go to serverf
cephadm shell -- ceph osd pool create rbd 32 32
cephadm shell -- ceph osd pool application enable rbd rbd
cephadm shell -- rbd pool init -p rbd
go to serverf
cephadm shell -- rbd create image1 --size 1024 --pool rbd --image-feature=exclusive-lock,journaling
cephadm shell -- rbd -p rbd ls
cephadm shell -- rbd --image image1 info
cephadm shell -- rbd mirror pool enable rbd pool
cephadm shell -- rbd --image image1 info
mkdir /root/mirror
In another terminal of clienta cephadm shell --mount /root/mirror/
In another terminal of clienta rbd mirror pool peer bootstrap create --site-name prod rbd > /mnt/bootstrap_token_prod
rsync -avP /root/mirror/bootstrap_token_prod serverf:/root/bootstrap_token_prod
go to serverf
cephadm shell -- rbd mirror pool info rbd
cephadm shell -- rbd rm image1 -p rbd
cephadm shell -- rbd -p rbd ls
use exit
