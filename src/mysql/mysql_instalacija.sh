#!/bin/bash

#Instalacija MySQL-a 
echo "Preuzimanje i instalacija MySQL..."
apt-get install -y mysql-server libmysqlclient-dev expect mysql-client
/etc/init.d/mysql start
