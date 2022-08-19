# Check connection with target machines is
ansible-playbook target-check.yml -i hosts.yml -l
ansible-playbook target-check.yml -i hosts.yml -l ProfittoTest

# Prepare Linux server with needed packages & oracle user & create needed dirs
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags prep-os

# Copy Java JDK
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags cp-jdk

# Copy Weblogic fmw
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags cp-fmw

# Extract and Install Java
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags install-jdk

# Install Weblogic
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags install-fmw

# Create DB repo & Create Domain & Start Machine
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags start-domain

# Create managed servers
ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest --tags fmw-server


# Run full Playbook
# ansible-playbook weblogic-fmw-domain.yml -i hosts.yml -l ProfittoTest