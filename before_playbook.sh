#! /bin/bash
sudo apt-get install ansible timeshift
ansible-galaxy install geerlingguy.swap 
ansible-galaxy install geerlingguy.clamav
ansible-galaxy install geerlingguy.firewall
ansible-galaxy install geerlingguy.security
ansible-galaxy install geerlingguy.docker
ansible-galaxy install veselahouba.crowdsec
#sudo timeshift --create --comment "First Snapshot"

# Install gvisor https://gvisor.dev/docs/user_guide/install/
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
curl -fsSL https://gvisor.dev/archive.key | sudo gpg --dearmor -o /usr/share/keyrings/gvisor-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/gvisor-archive-keyring.gpg] https://storage.googleapis.com/gvisor/releases release main" | sudo tee /etc/apt/sources.list.d/gvisor.list > /dev/null
sudo apt-get update && sudo apt-get install -y runsc
