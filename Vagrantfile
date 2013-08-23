# -*- mode: ruby -*-
# vi: set ft=ruby :
#squid
Vagrant.configure('2') do |config|
  config.vm.box = 'precise32updated'
  config.vm.hostname = 'squid'

  config.vm.network :forwarded_port, guest: 3128, host: 8123
  config.vm.synced_folder '.', '/vagrant', :extra => 'dmode=777,fmode=666'

  config.vm.provision :shell, :path => 'config_squid.sh'
end
