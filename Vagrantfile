#  .__   __.   ______   .___________. _______     _______.
#  |  \ |  |  /  __  \  |           ||   ____|   /       |
#  |   \|  | |  |  |  | `---|  |----`|  |__     |   (----`
#  |  . `  | |  |  |  |     |  |     |   __|     \   \    
#  |  |\   | |  `--'  |     |  |     |  |____.----)   |   
#  |__| \__|  \______/      |__|     |_______|_______/    
#                                                         
# If you create and destroy your vagrant machine then you may want to delete the hosts value to enable ssh
# ssh-keygen -f "~/.ssh/known_hosts" -R 192.168.0.117
# Test if your passwordless ssh works 
# svn ls svn+ssh://first_last@svn.piel.io/var/svn/piel-site/trunk
# Startup vagrant "vagrant up"
# Suspend vagrant "vagrant suspend"
# Resume vagrant  "vagrant resume" NOTE : You must do a reload to access shared folders
# Reload vagrant  "vagrant reload" NOTE : This does not re-provision chef only 'vagrant up' does that. Kill the chef-client in ps.
# Destroy vagrant "vagrant destroy -f"
# SSH into box "vagrant ssh" or use your own client with the vagrant User/Pass below
# Vagrant User/Pass : vagrant/vagrant
# Mysql User/Pass :  root/vagrant

#       _______. _______ .___________. __    __  .______   
#      /       ||   ____||           ||  |  |  | |   _  \  
#     |   (----`|  |__   `---|  |----`|  |  |  | |  |_)  | 
#      \   \    |   __|      |  |     |  |  |  | |   ___/  
#  .----)   |   |  |____     |  |     |  `--'  | |  |      
#  |_______/    |_______|    |__|      \______/  | _|      
#                                                          

BOXNAME  = 'ubuntu-14.04.amd64.virtualbox.box'
HOSTNAME = 'piel-dev-waynec'
MYIP     = '192.168.0.117'
MEMORY   = '1024'
CPUS     = '2'

#  ____    ____  ___       _______ .______          ___      .__   __. .___________.
#  \   \  /   / /   \     /  _____||   _  \        /   \     |  \ |  | |           |
#   \   \/   / /  ^  \   |  |  __  |  |_)  |      /  ^  \    |   \|  | `---|  |----`
#    \      / /  /_\  \  |  | |_ | |      /      /  /_\  \   |  . `  |     |  |     
#     \    / /  _____  \ |  |__| | |  |\  \----./  _____  \  |  |\   |     |  |     
#      \__/ /__/     \__\ \______| | _| `._____/__/     \__\ |__| \__|     |__|     
#                                                                                   
# Our script to do some housework
$script = <<SCRIPT
# Do custom Stuff here
SCRIPT

Vagrant.configure(2) do |config|
   config.vm.box = HOSTNAME
    config.vm.box_url = BOXNAME
    config.vm.host_name = HOSTNAME
    config.vm.provider "virtualbox" do |v|
      v.memory = MEMORY
      v.cpus = CPUS
    end
    config.vm.synced_folder "./www", "/var/www", owner: "www-data", group: "www-data"
    config.vm.synced_folder "./piel", "/var/piel", owner: "www-data", group: "www-data"
    config.vm.network "public_network", bridge: 'wlan0', ip: MYIP
    config.ssh.forward_agent = true
    config.vm.network "forwarded_port", guest: 3306, host: 33306
    config.vm.provision "shell", inline: $script, privileged: true, run: "once"

end


