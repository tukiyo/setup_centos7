test -z $(which ansible-playbook) && yum install -y epel-release && yum install -y ansible
ansible-playbook --diff -vv main.yml
