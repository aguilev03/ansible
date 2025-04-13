# Ansible Proxmox Playbook

This repository contains Ansible playbooks for managing and maintaining Proxmox nodes and their containers. The initial playbook is designed to perform system upgrades using `apt` across Proxmox and its containers.

## Current Uses:
### Apt update
ansible-playbook ./playbooks/apt.yml --key-file ~/.ssh/ansible --ask-become-pass -i inventory/hosts

### Apt update with password
ansible-playbook -i inventory/hosts playbooks/apt.yml --ask-pass --ask-become-pass -l [server]



## Features

- **Automated Upgrades**: Runs `apt upgrade` across all specified nodes and containers.
- **Centralized Management**: Simplify system updates using Ansible from a single control node.

## Prerequisites

- Ansible installed on your control node
- SSH access to all Proxmox nodes and containers
- Properly configured inventory file
- Python installed on target machines

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/aguilev03/ansible-proxmox.git
    cd ansible-proxmox
    ```
2. Ensure Ansible is installed:
    ```bash
    sudo apt update
    sudo apt install ansible -y
    ```

## Inventory

The inventory file (`hosts`) includes the list of Proxmox nodes and containers. Example format:

```ini
[solar]
proxmox-node-1 ansible_host=192.168.1.10
proxmox-node-2 ansible_host=192.168.1.11

[containers]
container-1 ansible_host=192.168.1.100
container-2 ansible_host=192.168.1.101
```

## Playbooks

- `apt.yml`: Runs `apt update` and `apt upgrade -y` on all specified hosts.

## Usage

1. Test connectivity using Ansible ping:
    ```bash
    ansible all -i hosts -m ping
    ```
2. Run the upgrade playbook:
    ```bash
    ansible-playbook -i hosts apt.yml
    ```

## Example `apt.yml`

```yaml
- hosts: solar
  become: yes
  tasks:
    - name: apt
      apt:
        update_cache: yes
        upgrade: 'yes'
```

## Troubleshooting

- Ensure SSH access with key-based authentication is configured.
- Confirm Ansible is installed using `ansible --version`.
- Verify connectivity using `ping` or `ansible all -m ping`.

## Contributing

Feel free to open issues or submit pull requests.

## License

This project is licensed under the [MIT License](LICENSE).
