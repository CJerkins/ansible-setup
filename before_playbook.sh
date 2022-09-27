#! /bin/bash
sudo apt-get install ansible timeshift
ansible-galaxy install geerlingguy.swap 
ansible-galaxy install geerlingguy.clamav
ansible-galaxy install geerlingguy.firewall
ansible-galaxy install geerlingguy.security
ansible-galaxy install geerlingguy.docker
#sudo timeshift --create --comment "First Snapshot"
