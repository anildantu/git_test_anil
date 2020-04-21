FROM docker.io/adantu/docker_macio:docker_macio
CMD ansible-playbook /macio_task/macio_playbook.yml 
