apk update && apk upgrade
apk add openssh-server
rc-update add sshd
/etc/init.d/sshd start

apk add rsync screen nano mosh
echo "export TERM=vt100" >> .profile
echo "export EDITOR=nano" >> .profile
source .profile
