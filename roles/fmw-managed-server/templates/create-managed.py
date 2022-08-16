
# Create Managed server [1]

ADMIN_SERVER_URL = 't3://' + '{{ admin_server_hostname }}' + ':' + '{{ admin_server_port }}';

connect('{{ weblogic_admin }}', '{{ weblogic_admin_pass }}', ADMIN_SERVER_URL);

edit();
startEdit();

cd('/')
cmo.createMachine('{{ server_hostname }}')

cd('/Machines/' + '{{ server_hostname }}' + '/NodeManager/' + '{{ server_hostname }}')
cmo.setListenAddress('{{ node_manager_listen_address }}')

cd('/')
cmo.createServer('{{ managed_server_1_name }}')

cd('/Servers/' + '{{ managed_server_1_name }}')
cmo.setListenAddress('{{ server_hostname }}')
cmo.setListenPort({{ managed_server_1_port }})
cmo.setMachine(getMBean('/Machines/' + '{{ server_hostname }}'))
applyJRF(target='{{ managed_server_1_name }}', domainDir='{{ domain_home }}');



# Create Managed server [2]

ADMIN_SERVER_URL = 't3://' + '{{ admin_server_hostname }}' + ':' + '{{ admin_server_port }}';

connect('{{ weblogic_admin }}', '{{ weblogic_admin_pass }}', ADMIN_SERVER_URL);

edit();
startEdit();

cd('/')
cmo.createMachine('{{ server_hostname }}')

cd('/Machines/' + '{{ server_hostname }}' + '/NodeManager/' + '{{ server_hostname }}')
cmo.setListenAddress('{{ node_manager_listen_address }}')

cd('/')
cmo.createServer('{{ managed_server_2_name }}')

cd('/Servers/' + '{{ managed_server_2_name }}')
cmo.setListenAddress('{{ server_hostname }}')
cmo.setListenPort({{ managed_server_2_port }})
cmo.setMachine(getMBean('/Machines/' + '{{ server_hostname }}'))
applyJRF(target='{{ managed_server_2_name }}', domainDir='{{ domain_home }}');

# applyJRF will call save and activate
save();
activate(block='true');
disconnect();
