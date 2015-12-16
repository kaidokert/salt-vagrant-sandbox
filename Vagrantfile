VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.synced_folder ".", "/vm_shared"
  config.vm.define :master do |master|
    master.vm.hostname = "saltmaster.int"
    master.vm.network :forwarded_port, guest: 4505, host: 4505
    master.vm.network :forwarded_port, guest: 4506, host: 4506
    master.vm.network :private_network, ip: "10.0.0.10"
    config.vm.provision "shell", path: "install-master.sh"
  end
  config.vm.define :minion1 do |minion1|
    minion1.vm.hostname = "minion1"
    minion1.vm.network :private_network, ip: "10.0.0.11"
    minion1.vm.network :forwarded_port, guest: 80, host:8080
    config.vm.provision "shell", path: "install-minion.sh webserver-1"
  end
end
