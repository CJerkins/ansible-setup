# Setup guide for not-so-harden-hardened-linux
Heres the thing, when you harden to the max you break shit. This is my happy middle that seems to work for me.

***apt***
- timeshift
- git
- vim
- apt-transport-https
- curl
- iptables-persistent
- wget
- software-properties-common

***manual install***  
- ZeroTier One (Mesh VPN)
- CrowdSec (IDS/IPS)
- Canary Token

## Step 1: Install the manual installs

### Timeshift snapshots 
Create Snapshots of your system as you go through the process. This will allow you to revert to a previous state if you need to.
`sudo timeshift --create --comment "First Snapshot"`
### To restore from a snapshot
`sudo timeshift --list`
`sudo timeshift --restore --snapshot "<snapshot-name>"`

### Install ZeroTier
```
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
```
`sudo zerotier-cli join <network_id>`

### Install CrowdSec
```
curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.deb.sh | sudo bash
sudo apt-get install crowdsec
curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.deb.sh | sudo bash
sudo apt install crowdsec-firewall-bouncer-iptables
```

### Install Canary Token
https://canarytokens.org/generate

### Install Ansible
`sudo apt-get install ansible`
```
ansible-galaxy install geerlingguy.swap 
ansible-galaxy install geerlingguy.clamav
ansible-galaxy install geerlingguy.firewall
ansible-galaxy install geerlingguy.security
```
### Create another snapshot
`sudo timeshift --create --comment "Pre-Ansible Snapshot"`

## Step 2: Run the playbook and get a cup of coffee.
`ansible-playbook --ask-become-pass playbook.yml`

### Block ping incoming REF: https://www.tecmint.com/block-ping-icmp-requests-to-linux/

### Install CasaOS
`curl -fsSL https://get.icewhale.io/casaos.sh | bash`



