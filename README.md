# Assessment 2

## Setting Up Terraform

`cd` into the `terraform` directory and run

```bash
terraform plan
terraform apply --auto-approve
```

Note the IP address of the server and the hostname of the MySQL RDS instance at the end

## Setting Up Ansible

`cd` into the `ansible` directory

Open `inventory.ini` and replace the IP address with the IP address of the server

Open `clone_repo_and_run.yaml` and replace the IP address and the hostname of the MySQL RDS instance

Run

```bash
ansible-playbook -i inventory.ini playbook.yaml
```
