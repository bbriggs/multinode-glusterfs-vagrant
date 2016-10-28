#! /bin/bash
vagrant ssh gluster-server-1 -c 'sudo gluster peer status ; sudo gluster volume info ;'
