machines = {
  "master" => {"memory" => "1024", "cpu" => "1", "ip" => "150", "image" => "alvistack/ubuntu-20.04"},
  "node01" => {"memory" => "1024", "cpu" => "1", "ip" => "151", "image" => "alvistack/ubuntu-20.04"}
  # "node02" => {"memory" => "1024", "cpu" => "1", "ip" => "102", "image" => "alvistack/ubuntu-20.04"},
  # "node03" => {"memory" => "1024", "cpu" => "1", "ip" => "103", "image" => "alvistack/ubuntu-20.04"}
}

Vagrant.configure("2") do |config|

  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
        machine.vm.network "public_network", ip: "192.168.100.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name = "#{name}"
        vb.memory = conf["memory"]
        vb.cpus = conf["cpu"]
      end

      machine.vm.provision "shell", path: "install-docker.sh"
      if "#{name}" == "master"
        machine.vm.provision "shell", path: "install-master.sh"
      else
        machine.vm.provision "shell", path: "install-worker.sh"
      end

    end
  end
end
