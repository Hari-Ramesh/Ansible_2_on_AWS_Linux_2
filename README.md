Installtion steps:
1. Ansible 
2. Tomcat
3. Jenkins

--------------------------------
Uninstall setps:

Ansible

Here's how to uninstall Ansible on Amazon Linux 2023:

1. Determine Installation Method:

Check with dnf list installed ansible or pip3 show ansible.

2. Uninstall Based on Method:

If installed using dnf:

Bash
sudo dnf remove ansible
Use code with caution. Learn more
If installed using pip:

Bash
sudo pip3 uninstall ansible
Use code with caution. Learn more
If installed through amazon-linux-extras:

Bash
sudo amazon-linux-extras disable ansible2
Use code with caution. Learn more
3. Remove Configuration Files (Optional):

If you want to remove configuration files as well:

Bash
sudo rm -rf /etc/ansible
Use code with caution. Learn more
4. Verify Removal:

Check for remaining files:

Bash
sudo find / -name 'ansible*'
Use code with caution. Learn more
Try running ansible --version. It should report "command not found."
