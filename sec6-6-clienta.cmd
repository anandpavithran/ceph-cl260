cephadm shell -- ceph health
#goto serverf
cephadm shell -- ceph osd pool create rbd 32
cephadm shell -- ceph osd pool application enable rbd rbd
cephadm shell -- rbd pool init -p rbd
cephadm shell -- 
cephadm shell -- 
cephadm shell -- 
cephadm shell -- 

