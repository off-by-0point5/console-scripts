apk update && apk upgrade
apk add openssh-server 
rc-update add sshd
/etc/init.d/sshd start