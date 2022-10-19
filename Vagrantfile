Vagrant.configure("2") do |config|

  # Box Settings
  config.vm.box = "ubuntu/focal64"

  # Provider Settings
  config.vm.provider :docker do |docker, override|
    override.vm.box = nil
    docker.image = "rofrano/vagrant-provider:ubuntu"
    docker.remains_running = true
    docker.has_ssh = true
    docker.privileged = true
    docker.volumes = ["/sys/fs/cgroup:/sys/fs/cgroup:rw"]
    docker.create_args = ["--cgroupns=host"]
  end

  # Folder Settings
  config.vm.synced_folder ".", "/home/vagrant"

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get upgrade -y
    apt-get install -y software-properties-common curl git build-essential
    apt-get install -y sudo
    apt-add-repository -y ppa:ansible/ansible
    apt-get update
    apt-get install -y curl git ansible build-essential
    apt-get clean autoclean
    apt-get autoremove --yes
  SHELL

  # Provision Settings
  # Vagrant.configure("2") do |config|
  #   config.vm.provision "ansible" do |ansible|
  #     ansible.playbook = "local.yml"
  #     ansible.ask_become_pass = true
  #     ansible.ask_vault_pass = true
  #   end
  # end

end
