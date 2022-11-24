#!/bin/bash

#Instalacija Postgres-a
echo "Preuzimanje i instalacija Postgres..."
apt-get update
apt-get install -y postgresql postgresql-contrib pgadmin3 libpq-dev
chmod 755 /home/$USER
