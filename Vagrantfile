Vagrant::Config.run do |config|

  config.vm.customize do |vm|
    vm.name = "dev-01.massiveapp.dev" # The name of the VM in VirtualBox
    vm.memory_size = 512 # The maximum amount of memory (in MB) to give to the VM
  end

  # The base box to use when creating the VM
  config.vm.box = "massiveapp-base64"

  # The hostname for the VM
  config.vm.host_name = "dev-01.massiveapp.dev"

  # The host-only network for the VM
  config.vm.network "33.33.13.37"

  # Share the puppet configuration to /etc/puppet
  config.vm.share_folder "puppet", "/etc/puppet", "puppet"

end
