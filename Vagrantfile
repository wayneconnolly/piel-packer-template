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

BOXNAME  = 'piel.box' #<---------------- change this to the box file.
HOSTNAME = 'piel-dev-brennorris' #<-------------- change this to the host name, if replacing this with an updgrade, you MUST perform "vagrant box remove piel-dev-brennorris" to remove the existing box from the catalogue.
MYIP     = '192.168.2.2' #<--------- your INTERNAL IP ( vagrant will set your metal as x.x.x.1, so dont use that', here I have my metal as 192.168.2.1 and 192.168.2.2 for the guest.
MYNETWORKIP = '192.168.0.60' #<----------- you EXTERNAL IP, this is the IP of your LAN to reside on.
MEMORY   = '2048'
CPUS     = '2'
ADAPTER = 'eth0' #wlan0 <- if you're using wifi, this is the the network metal, the name of the network interface to connect MYNETWORKIP to.

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

