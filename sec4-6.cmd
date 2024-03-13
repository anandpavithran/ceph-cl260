cephadm shell -- ceph auth get-or-create client.docedit mon 'allow r' osd 'allow rw pool=replpool1 namespace=docs' | sudo tee /etc/ceph/ceph.client.docedit.keyring
cephadm shell -- ceph auth get-or-create client.docget mon 'allow r' osd 'allow r pool=replpool1 namespace=docs' | sudo tee /etc/ceph/ceph.client.docget.keyring
cephadm shell -- ceph auth ls | grep -A3 -ie docedit -ie docget
rsync -v /etc/ceph/ceph.client.docedit.keyring serverd:/etc/ceph/
rsync -v /etc/ceph/ceph.client.docget.keyring serverd:/etc/ceph/
cephadm shell -- rados --id docedit -p replpool1 -N docs put adoc /etc/hosts
cephadm shell -- rados --id docget -p replpool1 -N docs get adoc /tmp/test
cephadm shell -- diff /etc/hosts /tmp/test
cephadm shell -- rados --id docget -p replpool1 -N docs put mywritetest /etc/hosts
cephadm shell -- ceph auth caps client.docget mon 'allow r' osd 'allow rw pool=replpool1 names pace=docs, allow rw pool=docarchive'
cephadm shell -- rados --id docget -p replpool1 -N docs put mywritetest /etc/hosts
rm /etc/ceph/ceph.client.docedit.keyring 
ssh serverd rm /etc/ceph/ceph.client.docedit.keyring
cephadm shell -- ceph auth del client.docedit
rm /etc/ceph/ceph.client.docget.keyring
ssh serverd rm /etc/ceph/ceph.client.docget.keyring
cephadm shell -- ceph auth del client.docget

