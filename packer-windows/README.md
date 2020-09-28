# Packer + Proxmox + Windows
This repo contains example code to create a Windows VMs on Proxmox with Packer v1.6.2

## Install Packer on macOS
1. `brew install packer`
  1. Install packer
1. `brew upgrade packer`
  1. Upgrade packer
1. `packer -v`
  1. Make sure the version is `1.6.2` or higher

## Build Win10x64 VM with Packer + Proxmox
1. `packer build`

## References
* [Disable IPv6 for All Network Adapters in PowerShell](https://www.tenforums.com/tutorials/90033-enable-disable-ipv6-windows.html)
* [Github issue - WinRM Gets IPv6 Address #230](https://github.com/jetbrains-infra/packer-builder-vsphere/issues/230)
* [Packer - WinRM Communicator Options](https://www.packer.io/docs/communicators/winrm)
* [Github - jaymecd/build_stig_windows_with_packer.md](https://gist.github.com/jaymecd/71e75fde7cc14e174dfff0a20f2262aa)
* [Allow Ping Requests by Using the Command Prompt](https://www.howtogeek.com/howto/windows-vista/allow-pings-icmp-echo-request-through-your-windows-vista-firewall/)
* [Command to enable remote administration of Windows Firewall](https://github.com/MicrosoftDocs/windowsserverdocs/issues/1894)
* [OS X: Make an ISO 2008](https://docwhat.org/os-x-make-an-iso)
* [Automated Windows 10 Installation with AutoUnattend and Packer](https://itspyworld.blogspot.com/2019/05/automated-windows-10-installation-with.html)
* [Packer - ubuntu-20.04-amd64-proxmox.json](https://github.com/chriswayg/packer-proxmox-templates/blob/master/ubuntu-20.04-amd64-proxmox/ubuntu-20.04-amd64-proxmox.json)
* [Enable PowerShell remoting](https://4sysops.com/wiki/enable-powershell-remoting/)
* [Packer - PowerShell Provisioner](https://www.packer.io/docs/provisioners/powershell)
* [Windows VirtIO Drivers](https://pve.proxmox.com/wiki/Windows_VirtIO_Drivers)
* [Allows for the mounting of ISOs when a Proxmox VM s created](https://github.com/hashicorp/packer/commit/e4f975fae1b4b7fb355f6e525b9538b40e1794ef)
* [Using autounattend.xml to enable Ansible support in Windows](https://madlabber.wordpress.com/2019/06/19/using-autounattend-xml-to-enable-ansible-support-in-windows/)
* [Autounattend.xml - Install drivers](https://grot.geeks.org/tanner/packer-windows/blob/bae4d5b880a080e3d1a101224c0fe65e18711771/answer_files/2019/Autounattend.xml)
* [Disable ipv6 on all ethernet adapters using powershell](http://www.herlitz.nu/2016/09/13/disable-ipv6-on-all-ethernet-adapters-using-powershell/)
* [How to disable Teredo Tuneling Pseudo Interface in my Windows 7?](https://superuser.com/questions/1392680/how-to-disable-teredo-tuneling-pseudo-interface-in-my-windows-7)
* [Github issue - Using Packer with Vault Secret Engine KV2 #7204](https://github.com/hashicorp/packer/issues/7204)
* [Packer - Template User Variables](https://www.packer.io/docs/templates/user-variables.html)
* []()
* []()
* []()
* []()
* []()
