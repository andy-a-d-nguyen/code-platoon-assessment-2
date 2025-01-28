# Assessment 2

## Setting Up Terraform

`cd` into the `terraform` directory and run

```bash
terraform plan
terraform apply --auto-approve
```

Note the IP address of the server and the hostname of the MySQL RDS instance at the end

## Setting Up Ansible

`cd` into the `ansible` directory and run

```bash
ansible-playbook -i inventory.ini playbook.yaml --extra-vars "ec2_address=<your_ec2_address> mysql_host=<your_mysql_host>"
```
