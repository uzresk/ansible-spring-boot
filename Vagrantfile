Vagrant.configure(2) do |config|
  config.vm.define "ansible-target" do |node|
        node.vm.box = "chef/centos-6.5-i386"
        node.vm.hostname = "ansible-target"
        node.vm.network :private_network, ip: "192.168.1.30"
        config.vm.provider :virtualbox do |vb|
        #    vb.gui = true
             vb.memory = 1024
        end
  end
  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http = "http://PROXY_URL:PROXY_PORT/"
    config.proxy.https = "http://PROXY_URL:PROXY_PORT/"
    config.proxy.no_proxy = "localhost,127.0.0.1,192.168."
  end
end
