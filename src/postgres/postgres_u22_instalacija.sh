#Instalacija Postgres-a
echo "Preuzimanje i instalacija Postgres..."
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && DEBIAN_FRONTEND=noninteractive apt-get update'
apt-get install libpq5=14.5-0ubuntu0.22.04.1
apt-get install -y postgresql postgresql-contrib pgadmin4 libpq-dev
chmod 755 /home/$USER