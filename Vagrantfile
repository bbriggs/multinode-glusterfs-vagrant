# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  # The "new" xenial box. This one is a brat and fails sometimes, so we run it first to catch errors early.
  config.vm.define vm_name = "gluster-xenial" do |config|
    config.vm.box = "ubuntu/xenial64"
    config.vm.hostname = vm_name
    ip = "172.21.12.9"
    config.vm.network :private_network, ip: ip
    config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq python-software-properties", :privileged => true
    config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:gluster/glusterfs-3.8", :privileged => true
    config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq glusterfs-server", :privileged => true
  end
  # We setup three nodes to be gluster hosts, and one gluster client to mount the volume
  (1..3).each do |i|
    config.vm.define vm_name = "gluster-server-#{i}" do |config|
      config.cache.scope = :box
      config.vm.hostname = vm_name
      ip = "172.21.12.#{i+10}"
      config.vm.network :private_network, ip: ip
      config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq python-software-properties", :privileged => true
      config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:gluster/glusterfs-3.8", :privileged => true
      config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq glusterfs-server", :privileged => true
    end
  end
  config.vm.define vm_name = "gluster-client" do |config|
    config.cache.scope = :box
    config.vm.hostname = vm_name
    ip = "172.21.12.10"
    config.vm.network :private_network, ip: ip
    config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq python-software-properties", :privileged => true
    config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive add-apt-repository ppa:gluster/glusterfs-3.5", :privileged => true
    config.vm.provision :shell, :inline => "DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -yq glusterfs-client", :privileged => true
  end
end
