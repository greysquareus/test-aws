all:
  children:
    master:
      hosts:
        ${master_ip}:
          ansible_ssh_private_key_file: ${master_key}
          ansible_user: ubuntu
    workers:
      hosts:
        ${worker1_ip}:
          ansible_ssh_private_key_file: ${worker1_key}
        ${worker2_ip}:
          ansible_ssh_private_key_file: ${worker2_key}
          ansible_user: ubuntu
  vars:
    ansible_ssh_common_args: '-o StrictHostKeyChecking=no'