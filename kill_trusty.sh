#! /bin/bash
vagrant halt gluster-server-1 &&
vagrant halt gluster-server-2 &&
vagrant halt gluster-server-3 &&
vagrant ssh gluster-xenial -c 'sudo gluster peer status ; sudo gluster volume info ;'
