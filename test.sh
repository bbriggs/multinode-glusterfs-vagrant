#! /bin/bash
vagrant ssh gluster-server-1 -c 'sudo gluster peer probe 172.21.12.12 ; sudo gluster peer probe 172.21.12.13'
vagrant ssh gluster-server-1 -c 'sudo gluster volume create glustertest replica 3 transport tcp 172.21.12.11:/brick 172.21.12.12:/brick 172.21.12.13:/brick force'
vagrant ssh gluster-server-1 -c 'sudo gluster volume start glustertest'
vagrant ssh gluster-client -c 'sudo mkdir /mnt/glusterfs && sudo mount -t glusterfs 172.21.12.11:/glustertest /mnt/glusterfs'
vagrant ssh gluster-client -c 'echo hello | sudo tee /mnt/glusterfs/f.txt'
vagrant ssh gluster-client -c 'sudo dd if=/dev/urandom of=/mnt/glusterfs/junk bs=64M count=16'

