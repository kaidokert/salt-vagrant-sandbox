aptitude install -y salt-master

#drop in master config file
cp /vm_shared/salt_fs/files/master_main.conf /etc/salt/master.d/main.conf

# avoid annoying dmidecode warnings
cp /bin/true /usr/local/sbin/dmidecode

# drop in all minion keys
cp -av /vm_shared/keydrop/* /etc/salt/pki/master/minions/
# fix permissions for everything
chown -R ubuntu:adm \
  /usr/local/sbin/dmidecode \
  /etc/salt/pki/master/minions/ \
  /var/log/salt \
  /etc/salt/pki/master/master.*

service salt-master restart
service salt-minion restart
