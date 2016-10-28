# GlusterFS 3.5 client with 3.8 server validation

## Install prerequisites

Install [Vagrant](http://www.vagrantup.com/downloads.html) and a provider such as [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

We'll also need the [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier) plugin so we don't pull all of these packages unnecessarily on four hosts.

```console
vagrant plugin install vagrant-cachier
```

## Start the VMs

This instructs Vagrant to start the VMs and install GlusterFS on them.

```console
vagrant up
```
## Run the validation scripts

```console
# Initialize the cluster, connect to peers, write some test data
./test.sh
# Check to make sure you have a healthy cluster
./test_trusty.sh
# Add in our new 3.8 Xenial box
./add_xenial.sh
# Check to make sure we still have consistency
./test_trusty.sh
# Now kill your trusty boxes and see that the last Xenial box is maintaining the cluster
./kill_trusty.sh
```

## Cleanup

When you're all done, tell Vagrant to destroy the VMs.

```console
vagrant destroy -f
```
