cephadm shell -- ceph status
cephadm shell -- ceph osd pool create rbd 32 32
cephadm shell -- ceph osd pool application enable rbd rbd
cephadm shell -- rbd pool init -p rbd
In another terminal of serverf cephadm shell --mount /root/bootstrap_token_prod
cephadm shell -- ceph orch apply rbd-mirror --placement=serverf.lab.example.com
cephadm shell -- rbd mirror pool peer bootstrap import --site-name bup --direction rx-only rbd /mnt/bootstrap_token_prod
cephadm shell -- rbd -p rbd ls
Go to clienta
cephadm shell -- rbd mirror pool info rbd 
cephadm shell -- rbd mirror pool status
Go to clienta
use exit
