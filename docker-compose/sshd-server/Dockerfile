# 指定創建的基礎鏡像
FROM ubuntu:22.04

# 標籤訊息 (optional)
LABEL authors="actfire@gmail.com"

COPY entrypoint.sh /

# install package
RUN DEBIAN_FRONTEND=noninteractive set -uex; \
    # update apt-get
    apt-get update; \
    # Install main dependencies
    apt-get install -y apt-utils; \
    apt-get install -y sudo; \
    apt-get install -y curl; \
    apt-get install -y zip; \
    apt-get install -y gnupg2; \
    apt-get install -y sshpass; \
    apt-get install -y openssh-server; \
    apt-get install -y rsync; \
    apt-get install -y vim; \
    # ssh setting
    mkdir /run/sshd; \
    # 建立 sshd 配置文件,允許 root 登入和 PasswordAuthentication
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config; \
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config; \
    # give exec permission
    chmod +x /entrypoint.sh; \
    apt-get clean; \
    # set project files folder and give group permission
    mkdir /ProjectFiles; \
    groupadd dev; \
    chgrp dev /ProjectFiles; \
    chmod g+rwx /ProjectFiles;



# 開放埠號
EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
