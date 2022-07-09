apk update && apk upgrade
apk add openssh-server
rc-update add sshd
/etc/init.d/sshd start

apk add rsync tmux micro mosh
echo "export TERM=vt100" >> .profile
echo "export EDITOR=micro" >> .profile
source .profile
