nodes = {
  web1: {
    ip: '192.168.1.10',
  },
  web2: {
    ip: '192.168.1.15',
  },
  registry: {
    ip: '192.168.1.11',
  },
  rsyslogserver: {
    ip: '192.168.1.5',
  }
}

Vagrant.configure(2) do |config|
  etc_hosts = nodes.map { |name, data| [data[:ip], name].join(' ') }.join("\n")

  nodes.each do |nodename, nodedata|
    config.vm.define nodename do |thisnode|
      thisnode.vm.box = "centos/7"
      thisnode.vm.hostname = nodename.to_s
      thisnode.vm.network 'private_network', ip: nodedata[:ip]
      thisnode.vm.provision 'shell', inline: "echo '#{etc_hosts}' >> /etc/hosts"
      thisnode.vm.provision 'shell',
        path: './provision/docker.sh'
      thisnode.vm.provision "file",
        source: "./provision/daemon.json",
        destination: "/tmp/daemon.json"
      thisnode.vm.provision 'shell',
        path: './provision/poststart.sh'
      if thisnode.vm.hostname == 'registry'
        thisnode.vm.provision 'shell', path: "./provision/registry.sh"
      end

      thisnode.vm.provider 'virtualbox' do |v|
        v.memory = "1024"
        v.cpus = "1"
        v.customize ['modifyvm', :id, '--nicpromisc2', 'allow-all']
        v.customize ['modifyvm', :id, '--cpuexecutioncap', '90']
      end
    end
  end
end
