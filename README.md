Weblogic Ansible Playbook  12.2.1.3.0 [Two Managed Servers]
======================================
# ValU DevOps
# Ahmed Fadel
=====================================


## Detailed info

An Ansible Playbook (weblogic-fmw-domain.yml) to install and configure a WebLogic Server 12c with 
Oracle Fusion Middleware software for hosting Oracle Fusion Middleware applications in Redhat Linux 7 (RHEL/CentOS/Oracle Linux) system.

============================================================================================================================================

## Requirments to be added and configured before starting

1. Target Machine user Ansible is connecting to
    ==> location: infra-vars.yml    ==> input at: [ssh_user:]
    ==> Before running playbook the user should be added to the ".ssh" file
    ==> Using ansible user run command:    $ ssh-copy-id user@xxx.xxx.xxx.xxx 
    ==> Users pass are stored in file "/home/ansible/.ssh/id_rsa.pub"

2. Oracle user password 
    ==> location: secrets ==> input at: [oracle_os_user_pass:]  #I suggest don't change

3. Weblogic password
    ==> location: secrets ==> input at: [weblogic_admin_pass:]  #I suggest don't change

4. Node manager password
    ==> location: secrets ==> input at: [nodemanager_password:]  #I suggest don't change

5. database settings for repository
    ==> location: infra-vars.yml    ==> input at: [dbserver_name:]   #Request from DB team
    ==> location: infra-vars.yml    ==> input at: [dbserver_port:]   #Request from DB team
    ==> location: infra-vars.yml    ==> input at: [dbserver_service:]   #Request from DB team
    ==> location: infra-vars.yml    ==> input at: [repository_prefix:]   #Request from DB team
    ==> location: secrets ==> input at: [datasource_password:]   #Request from DB team
    ==> location: secrets ==> input at: [sysdba_passwd:]   #Request from DB team

6. Target host group
    ==> location: hosts     ==> input will be added to the ansible-playbook command line

============================================================================================================================================
## The playbook includes the following Ansible Roles:
- linux-wls: Configures the linux system with required packages, kernel settings etc.
- linux-jdk: Installs Oracle JDK.
- fmw-software: Installs Oracle Fusion Middleware Infrastructure software.
- fmw-domain: Creates a Domain with Fusion Middleware support (Enterprise Manager, JRF, etc).
- fmw-managed-server: Creates a managed server for host applications.

============================================================================================================================================
## Running Playbook:

1. Make sure the right installment packages for "JDK , Weblogic" are in the required directories.
    ==> jdk_installation_archive= 'jdk-8u172-linux-x64.tar.gz'      ==> location= roles/linux-jdk/files/jdk-8u172-linux-x64.tar.gz
    ==> Weblogic_installation_archive= 'fmw_12.2.1.3.0_infrastructure.jar'      ==> location= roles/fmw-sofware/files/fmw_12.2.1.3.0_infrastructure.jar

2. Running ansible commands are stored in "running_commands.sh"

3. Add local machine user in the command line after "-u"

4. Make sure you add "host group" in the command line after "-l"

5. To run specific role, run ansible-playbook with related tag in the command line after "--tags"

ansible-playbook weblogic-fmw-domain.yml -u {user} -i hosts -l {hostgroup} --tags {role-tag}



============================================================================================================================================

## Output should be
01. Installed and ready to use Weblogic on machine localhost
02. Weblogic username= weblogic
03. Oracle user= oracle
04. domain= ValU_domain
05. nodemanager         ==> name= username= weblogic , port= 5556
06. admin_server_name= AdminServer , port= 7001
07. Two managed servers     ==> managed_server_1_name= ValU_server_1 , port= 7010