# Ansible Proxmox Playbook

This repository contains Ansible playbooks for managing and maintaining Proxmox nodes and their containers. The initial playbook is designed to perform system upgrades using apt across Proxmox and its containers.

Features

Automated Upgrades: Runs apt upgrade across all specified nodes and containers.

Centralized Management: Simplify system updates using Ansible from a single control node.

Prerequisites

Ansible installed on your control node

SSH access to all Proxmox nodes and containers

Properly configured inventory file

Python installed on target machines

Installation

Clone the repository:

git clone https://github.com/aguilev03/ansible-proxmox.git
cd ansible-proxmox

Ensure Ansible is installed:

sudo apt update
sudo apt install ansible -y

Inventory

The inventory file (inventory) includes the list of Proxmox nodes and containers. Example format:

[proxmox]
proxmox-node-1 ansible_host=192.168.1.10
proxmox-node-2 ansible_host=192.168.1.11

[containers]
container-1 ansible_host=192.168.1.100
container-2 ansible_host=192.168.1.101

Playbooks

apt-upgrade.yml: Runs apt update and apt upgrade -y on all specified hosts.

Usage

Test connectivity using Ansible ping:

ansible all -i inventory -m ping

Run the upgrade playbook:

ansible-playbook -i inventory apt-upgrade.yml

Example apt-upgrade.yml

---
- name: Upgrade all packages using apt
  hosts: all
  become: yes
  tasks:
    - name: Update apt cache
      apt:
        update_cache: yes
    
    - name: Perform upgrade
      apt:
        upgrade: dist

Troubleshooting

Ensure SSH access with key-based authentication is configured.

Confirm Ansible is installed using ansible --version.

Verify connectivity using ping or ansible all -m ping.

Contributing

Feel free to open issues or submit pull requests.

License

This project is licensed under the MIT License.