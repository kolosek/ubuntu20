#!/bin/bash

#Preuzimanje i instalacija OpenSSL (v 1.1.1s)
echo "Preuzimanje i instalacija OpenSSL verzije 1.1.1s..."
mkdir openssl-old-1.1.1s
cd openssl-old-1.1.1s
wget https://www.openssl.org/source/openssl-1.1.1s.tar.gz
tar -xvzf openssl-1.1.1s.tar.gz
cd openssl-1.1.1s
apt-get update
apt-get install -y make build-essential 
./config --prefix=/opt/openssl-1.1.1s shared
make && make test && make install
export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
cd ..
cd ..