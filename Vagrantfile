defports = [ 80, 443 ]
Vagrant.configure(2) do |config|
  config.vm.synced_folder ".", "/vm_shared"
  {
    precise: {box: 'ubuntu/precise64', ip: 11, base: 60 },
    trusty:  {box: 'ubuntu/trusty64' , ip: 12, base: 70 },
    master:  {box: 'ubuntu/trusty64' , ip: 10, base: 80 , master: true },
  }.each do |vmname, value|
    config.vm.define vmname, primary: value[:master] do |vm|
      vm.vm.host_name = vmname
      vm.vm.box = value[:box]
      vm.vm.network :private_network, ip: "10.0.0.#{value[:ip]}"
      vm.vm.provision "shell", path: "install-minion.sh", args: "#{vmname}"
      defports.each { |p| vm.vm.network :forwarded_port, guest: p , host: (p + value[:base] * 100) }
      if value[:master]
        [4505, 4506].each { |p| vm.vm.network :forwarded_port, guest: p , host: p }
        vm.vm.provision "shell", path: "install-master.sh"
      end
    end
  end
end
