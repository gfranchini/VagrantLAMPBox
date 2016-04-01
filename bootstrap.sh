#!/usr/bin/env bash

apt-get update
echo "Installing Apache"
apt-get install -y apache2
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

echo "Installing PHP5"
sudo apt-get install -y php5 libapache2-mod-php5
apt-get -y autoremove

echo "Installing MySQL"
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get install -y mysql-server

echo "Build Complete! :)"
