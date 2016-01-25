export MINION=$1
mkdir -p /etc/salt/minion.d/
echo 'master: 10.0.0.10' > /etc/salt/minion.d/main.conf
echo 'id: ' $MINION >> /etc/salt/minion.d/main.conf

REL=$(lsb_release -r | sed s/Release:\\s*//)
CODE=$(lsb_release -c | sed s/Codename:\\s*//)
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DE57BFBE
sudo add-apt-repository "deb http://repo.saltstack.com/apt/ubuntu/$REL/amd64/latest $CODE main"
sudo aptitude update
sudo aptitude install -y salt-minion

mkdir -p /vm_shared/keydrop
sh -c 'sleep 3;cp /etc/salt/pki/minion/minion.pub /vm_shared/keydrop/$MINION;echo done' &

# this doesnt seem necessary mostly
ssh -c 'for i in $(seq 1 3); do sleep 10 ; echo $i; done; echo Restarted; service salt-minion restart' &
