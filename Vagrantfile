Vagrant.configure('2') do |config|
  config.ssh.forward_agent = true
  config.vm.box = 'cargomedia/debian-7-amd64-default'

  synced_folder_type = ENV.fetch('SYNC_TYPE', 'nfs')
  synced_folder_type = nil if 'vboxsf' == synced_folder_type

  config.vm.network :private_network, ip: '10.10.10.11'
  config.vm.network :public_network, :bridge => 'en0: Wi-Fi (AirPort)'
  config.vm.synced_folder '.', '/home/vagrant/elixir-404', :type => synced_folder_type, :rsync__args => ["--verbose", "--archive", "--delete", "-z"]

  config.vm.provision 'shell', run: 'always', inline: [
    'wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb',
    'sudo apt-get update',
    'DEBIAN_FRONTEND=noninteractive apt-get -qqy -o Dpkg::Options::="--force-confold install elixir',
    'export PATH="$PATH:/path/to/elixir/bin"',
  ].join(' && ')
end
