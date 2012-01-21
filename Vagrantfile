Vagrant::Config.run do |config|

  config.vm.customize ["modifyvm", :id,
                       "--name", "dev-01.massiveapp.dev",  # The name of the VM in VirtualBox
                       "--memory", "512" # The maximum amount of memory (in MB) to give to the VM
                      ]

  # The base box to use when creating the VM
  config.vm.box = "massiveapp-base64"

  # The hostname for the VM
  config.vm.host_name = "dev-01.massiveapp.dev"

  # The host-only network for the VM
  config.vm.network :hostonly, "33.33.13.37"

  # Share the puppet configuration to /etc/puppet
  config.vm.share_folder "puppet", "/etc/puppet", "puppet"

end
