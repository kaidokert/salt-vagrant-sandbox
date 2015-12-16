sh ./install-minion.sh salt-master

aptitude install -y salt-master

#permission to log
chown ubuntu:adm /var/log/salt

# avoid dmidecode warnings
touch /usr/local/sbin/dmidecode && chmod +x /usr/local/sbin/dmidecode

# deploy master conf
cp /vm_shared/master_main.conf /etc/salt/master.d/main.conf

service salt-master restart
