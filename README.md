# CI/CD (On-premise)

This repository is explain that building simple `CI/CD` on On-premise environment. You need a Kubernetes cluster. If you don't have kubernetes cluster, you should setup cluster.

### **Pre infra**

![Static Badge](https://img.shields.io/badge/kubernetes-1.30.0-%23326CE5?logo=kubernetes&labelColor=white)
![Static Badge](https://img.shields.io/badge/helm-3.17.1-%230F1689?logo=helm&logoColor=%230F1689&labelColor=white)

### **CI/CD Tools**

![Static Badge](https://img.shields.io/badge/gitlab-17.10-%23FC6D26?logo=gitlab&logoColor=%23FC6D26&labelColor=white)
![Static Badge](https://img.shields.io/badge/harbor-2.12.0-%2360B932?logo=harbor&logoColor=%2360B932&labelColor=white)
![Static Badge](https://img.shields.io/badge/jenkins-2.492-%23D24939?logo=jenkins&logoColor=%23D24939&labelColor=white)
![Static Badge](https://img.shields.io/badge/argo-2.14.9-%23FC6D26?logo=argo&logoColor=%23EF7B4D&labelColor=white)

### **Final Architecture**

<dev>images</dev>

k8s cluster info
```
OS      :   Ubuntu 22.04
core    :   4
memory  :   32GiB
Disk    :   100GiB

MasterNode
    IP  :   192.168.9.10

WorkerNode x2
    IP  :   192.168.9.11~12
```

## **🧩 GitLab Server install**

`gitlab` server vm spec >> [GitLab Install Docs](https://about.gitlab.com/install/#ubuntu)

```
OS      :   Ubuntu 22.04
core    :   4
memory  :   32GiB
Disk    :   100GiB
IP      :   192.168.9.13
```

```bash
sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl
sudo apt-get install -y postfix

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash

sudo apt update
sudo apt install gitlab-ee
```

gitlab config file. `/etc/gitlab/gitlab.rd`

ex)
```rb
##! Note: During installation/upgrades, the value of the environment variable
##! EXTERNAL_URL will be used to populate/replace this value.
##! On AWS EC2 instances, we also attempt to fetch the public hostname/IP
##! address from AWS. For more details, see:
##! https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
external_url 'http://192.168.9.13'

## Roles for multi-instance GitLab
##! The default is to have no roles enabled, which results in GitLab running as an all-in-one instance.
##! Options:
##!   application_role
```
Apply
```bash
# Apply config
sudo gitlab-ctl reconfigure

# Admin Password
sudo cat /etc/gitlab/inital_root_password
```

## **🧩 Harbor on k8s**

## **🧩 Jenkins on k8s**

## **🧩 Argo on k8s**