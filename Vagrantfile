# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "puppetlabs/ubuntu-14.04-64-puppet"

  # Set Hostname
  config.vm.hostname = 'user-test'

  # Bootstrap puppet
  config.vm.provision :shell, path: 'install_modules.sh'

  config.vm.provision :puppet do |puppet|
    puppet.hiera_config_path = 'puppet/hiera.yaml'
    puppet.manifest_file     = 'site.pp'
    puppet.manifests_path    = 'puppet/manifests'
    puppet.module_path       = 'puppet/modules'
    puppet.options           = '--verbose'
    puppet.facter = {
      'fqdn' => 'user-test'
    }
  end
end
