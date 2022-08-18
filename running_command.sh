# Prepare Linux server with needed packages
ansible-playbook weblogic-fmw-domain.yml -i hosts -l ProfittoTest --tags os

# Extract and Install Java
ansible-playbook weblogic-fmw-domain.yml -i hosts -l ProfittoTest --tags jdk

# Install Weblogic
ansible-playbook weblogic-fmw-domain.yml -i hosts -l ProfittoTest --tags sw

# Create DB repo & Create Domain & Start Machine
ansible-playbook weblogic-fmw-domain.yml -i hosts -l ProfittoTest --tags dom

# Create managed servers
ansible-playbook weblogic-fmw-domain.yml -i hosts -l ProfittoTest --tags ms


# Run full Playbook
# ansible-playbook weblogic-fmw-domain.yml -i hosts -l ProfittoTest



# Prepare Linux server with needed packages
ansible-playbook weblogic-fmw-domain.yml -i inventory -l ProfittoTest --tags os

# Extract and Install Java
ansible-playbook weblogic-fmw-domain.yml -i inventory -l ProfittoTest --tags jdk

# Install Weblogic
ansible-playbook weblogic-fmw-domain.yml -i inventory -l ProfittoTest --tags sw

# Create DB repo & Create Domain & Start Machine
ansible-playbook weblogic-fmw-domain.yml -i inventory -l ProfittoTest --tags dom

# Create managed servers
ansible-playbook weblogic-fmw-domain.yml -i inventory -l ProfittoTest --tags ms


# Run full Playbook
# ansible-playbook weblogic-fmw-domain.yml -i inventory -l ProfittoTest