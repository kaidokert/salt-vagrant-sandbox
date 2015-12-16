add-apt-repository -y ppa:saltstack/salt
aptitude update
aptitude install -y salt-minion

echo 'master: 10.0.0.10' > /etc/salt/minion.d/main.conf
echo 'id: ' $1 >> /etc/salt/minion.d/main.conf

service salt-minion restart
