#! /bin/bash
vagrant ssh gluster-server-1 -c 'sudo gluster peer probe 172.21.12.9' &&
vagrant ssh gluster-server-1 -c 'sudo gluster volume add-brick glustertest replica 4 172.21.12.9:/brick force'
