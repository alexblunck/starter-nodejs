# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "starter-node"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.synced_folder "./", "/home/vagrant/app"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
  end

  config.vm.provision :shell, :path => "./provision.sh"
end
