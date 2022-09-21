# FROM centos:7
FROM oraclelinux:9-slim

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN yum check-update; \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum install -y python3-pip; \
    yum install -y wget git; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible; \
    ansible-galaxy collection install azure.azcollection; \
    pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt
    
    
# RUN yum install zsh -y; \
#     chsh -s /bin/zsh root; \
#     wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh; \
#     /bin/cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
