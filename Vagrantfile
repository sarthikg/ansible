Vagrant.configure("2") do |config|

  # Operating System
  config.vm.box = "generic/ubuntu2204"

  # Provider Settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "8192"
    vb.cpus = 2
  end

  # Synced Folders
  config.vm.synced_folder ".", "/home/vagrant/.sarthik"

  # Commands to be run
  config.vm.provision "shell", inline: <<-SHELL
    ./.sarthik/dev.sh
  SHELL

end
