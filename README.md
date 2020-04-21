# git_test_anil
Two files Dockerfile and macio_playbook.yml are made available for this task of quering https://macaddress.io/ for MAC address lookup API

Please follow below steps for validating and running the application:
--------------------------------------------------------------------

++ Pull docker image using - "docker pull adantu/docker_macio:docker_macio"
++ Copy "Dockerfile" to current working directory and then run command - "docker build --tag docker_macio ."
++ Now run the command - "docker run -it docker_macio" and pass the mac-address when prompted.



-------------------------------------------------------------------------------------------------------

Summary of the Task work:
-----------------------
++ Created a container and installed Ansible package
++ Created Ansible plabook and tested it inside container for successfull API query for company name of mac-address using uri module.
++ "docker commit" the working container having Ansible package and ansible playbook
++ "docker build" new container image using - image from docker commit using dockerfile. Containerising the playbook.
++ "docker run" image from previous Build and pass mac-address when prompted

---------------------------------------------------------------------------------------------------------------------------




Sample output(test run):
------------------------
[root@localhost ~]# docker pull adantu/docker_macio
Using default tag: latest
Trying to pull repository docker.io/adantu/docker_macio ...
manifest for docker.io/adantu/docker_macio:latest not found
[root@localhost ~]# docker pull adantu/docker_macio:docker_macio
Trying to pull repository docker.io/adantu/docker_macio ...
docker_macio: Pulling from docker.io/adantu/docker_macio
8a29a15cefae: Pull complete
4075adb80521: Pull complete
Digest: sha256:55345e20ee3815489cfeab0187e92dbdc97073394310bdf42f8aedbe4dda49f5
Status: Downloaded newer image for docker.io/adantu/docker_macio:docker_macio
[root@localhost ~]#
[root@localhost ~]# docker images
REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
docker.io/adantu/docker_macio   docker_macio        b78880c59315        7 hours ago         532 MB
[root@localhost ~]#
[root@localhost ~]# cat Dockerfile
FROM docker.io/adantu/docker_macio:docker_macio
CMD ansible-playbook /macio_task/macio_playbook.yml
[root@localhost ~]#
[root@localhost ~]# docker build --tag docker_macio .
Sending build context to Docker daemon 11.18 MB
Step 1/2 : FROM docker.io/adantu/docker_macio:docker_macio
 ---> b78880c59315
Step 2/2 : CMD ansible-playbook /macio_task/macio_playbook.yml
 ---> Running in 0dc6fe34306f
 ---> 148d792730fa
Removing intermediate container 0dc6fe34306f
Successfully built 148d792730fa
[root@localhost ~]#
[root@localhost ~]#

[root@localhost ~]#
[root@localhost ~]#
[root@localhost ~]# docker images
REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
docker_macio                    latest              148d792730fa        5 minutes ago       532 MB
docker.io/adantu/docker_macio   docker_macio        b78880c59315        7 hours ago         532 MB
[root@localhost ~]# docker run -it docker_macio

Welcome to https://macaddress.io

 Enter the Mac address:: 0032.174c.0828

PLAY [Running playbook to query https://macaddress.io/ via API] *********************************************************************************************

TASK [Accessing url -] **************************************************************************************************************************************
ok: [localhost]

TASK [debug] ************************************************************************************************************************************************
ok: [localhost] => {
    "msg": "Entered Mac-address:'0032.174c.0828' belongs to Company: 'Cisco Systems, Inc'"
}

PLAY RECAP **************************************************************************************************************************************************
localhost                  : ok=2    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0

[root@localhost ~]#
