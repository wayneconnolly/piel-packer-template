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

#The name of your vagrant box file name
BOXNAME  = 'piel.box'

#The host name to use, READ!!!!: if you've used this hostname before and you're perform an upgrade you should perform;
#vagrant box remove piel-dev-brennorris to remove this host from the vagrant catalogue
HOSTNAME = 'piel-dev-brennorris'

#you will receive an internal network, this is the IP address for the box on this network; do NOT use x.x.x.1 as the host (your metal) will get that IP address thus;
#( your metal/host 192.168.2.1 ) <-> ( this vm/guest 192.168.2.2 )
MYIP     = '192.168.2.2'

#your external IP, a static IP address for the vm/guest on the physical network (which your internet router is connected to )
MYNETWORKIP = '192.168.0.60'

MEMORY   = '2048'
CPUS     = '2'

#The name of your physical network interface card for adapater 2 (the internet) ; for wifi it is most common to have 'wlan0' , for ethernet 'eth0'.
ADAPTER = 'eth0'

#  ____    ____  ___       _______ .______          ___      .__   __. .___________.
#  \   \  /   / /   \     /  _____||   _  \        /   \     |  \ |  | |           |
#   \   \/   / /  ^  \   |  |  __  |  |_)  |      /  ^  \    |   \|  | `---|  |----`
#    \      / /  /_\  \  |  | |_ | |      /      /  /_\  \   |  . `  |     |  |     
#     \    / /  _____  \ |  |__| | |  |\  \----./  _____  \  |  |\   |     |  |     
#      \__/ /__/     \__\ \______| | _| `._____/__/     \__\ |__| \__|     |__|     
#                                                                                   

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
    config.vm.network "public_network", bridge: ADAPTER, ip: MYNETWORKIP
    config.vm.network "private_network", :ip => MYIP, :name => 'pielinternal', :adapter => 2
    config.ssh.forward_agent = true
    config.vm.network "forwarded_port", guest: 3306, host: 33306
end

