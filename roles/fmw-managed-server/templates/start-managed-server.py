#connect('{{ weblogic_admin }}', '{{ weblogic_admin_pass }}')
#start('{{ managed_server_1_name }}')
#connect('{{ weblogic_admin }}', '{{ weblogic_admin_pass }}')
#start('{{ managed_server_2_name }}')

nmConnect('{{ nodemanager_username }}', '{{ nodemanager_password }}', '{{ node_manager_listen_address }}', '{{ node_manager_listen_port }}', '{{ domain_name }}');
nmStart('{{ managed_server_1_name }}');

nmConnect('{{ nodemanager_username }}', '{{ nodemanager_password }}', '{{ node_manager_listen_address }}', '{{ node_manager_listen_port }}', '{{ domain_name }}');
nmStart('{{ managed_server_2_name }}');

nmDisconnect();