Run the following commands to get a Local YUM Repository for installing required packages to add linux client to AD Domain.
1.	 sudo mkdir /cdrom 
2.	 
3.	 sudo mount /dev/cdrom /cdrom 
4.	 sudo mv /etc/yum.repos.d/*.repo /tmp/ 
5.	 sudo vi /etc/yum.repos.d/local.repo 
6.	 Press the enter key then type in the repository details.
7.	 [LocalRepo]	
name=Local Repository
 baseurl=file:///cdrom
 enable=1
gpgcheck=0 
8.	Type in “esc:wq” on the keyboard to save and quit the file.
9.	 sudo yum clean all 
10.	sudo yum update -y 
 
11.	Clear the terminal with clear command, then type in the following commands
12.	 sudo dhclient -- to request an IP address from the DHCP server.
13.	 sudo realm discover -- to show the domain and required packages that can be added.
14.	 sudo yum install oddjob oddjob-mkhomedir sssd adcli samba-common-tools samba-common -y -- to install required packages.
 
16.	 sudo realm join (domain name)
17.	 sudo realm list to check if AD domain joined successfully.
