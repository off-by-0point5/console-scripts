apk update && apk upgrade
apk add openssh-server
rc-update add sshd
/etc/init.d/sshd start

apk add rsync tmux micro exa bat
echo "export TERM=xterm-256color" >> .profile
echo "export EDITOR=micro" >> .profile
echo "alias here=\"cd \$(pwd)\"" >> .profile
echo "alias copy=\"rsync -a\"" >> .profile
echo "alias lsl=\"exa -l -a\"" >> .profile
echo "alias cat=\"bat\"" >> .profile
source .profile
