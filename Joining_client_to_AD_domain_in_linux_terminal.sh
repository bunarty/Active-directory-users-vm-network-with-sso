#Run the following commands to get a Local YUM Repository for installing required packages to add linux client to AD Domain.
sudo mkdir /cdrom 
sudo mount /dev/cdrom /cdrom 
sudo mv /etc/yum.repos.d/*.repo /tmp/ 
sudo vi /etc/yum.repos.d/local.repo 
#Press the enter key then type in the repository details.
 [LocalRepo]	
 name=Local Repository
 baseurl=file:///cdrom
 enable=1
 gpgcheck=0 
#Type in “esc:wq” on the keyboard to save and quit the file.
sudo yum clean all 
sudo yum update -y 
 
#Clear the terminal with clear command, then type in the following commands
sudo dhclient #to request an IP address from the DHCP server.
 sudo realm discover #to show the domain and required packages that can be added.
sudo yum install oddjob oddjob-mkhomedir sssd adcli samba-common-tools samba-common -y #to install required packages.
 
sudo realm join (domain name)
sudo realm list #to check if AD domain joined successfully.
