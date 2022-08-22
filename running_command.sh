# Check connections

# Check connection with all servers
ansible-playbook target-check.yml -i hosts.yml -l all

# Check connection with Test servers
ansible-playbook target-check.yml -i hosts.yml -l EnvironmentTest

# Check connection with target servers
ansible-playbook target-check.yml -i hosts.yml -l ProfittoTest

###########################################################################################
###########################################################################################
###########################################################################################

# Running Playbook

# Prepare Linux server with needed packages & oracle user & create needed dirs
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags prep-os

# Copy Java JDK
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags cp-jdk

# Extract and Install Java
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags install-jdk

# Copy Weblogic fmw
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags cp-fmw

# Install Weblogic
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest-7 --tags install-fmw

# Create DB repo & Create Domain & Start Machine
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest-7 --tags fmw-domain

# Create managed servers
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags fmw-server


# Run full Playbook
# ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest