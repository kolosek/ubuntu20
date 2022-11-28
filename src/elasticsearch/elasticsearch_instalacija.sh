#!/bin/bash

#Preuzimanje i instalacija Elasticsearch-a
echo "Preuzimanje i instalacija Elasticsearch-a..."
#curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | gpg --dearmor -o /usr/share/keyrings/elastic.gpg
#echo "deb [signed-by=/usr/share/keyrings/elastic.gpg] https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list
#apt-get update
#apt-get install elasticsearch
#systemctl start elasticsearch
#systemctl enable elasticsearch

cd /usr/share
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.5.2-linux-x86_64.tar.gz
tar -xvzf elasticsearch-8.5.2-linux-x86_64.tar.gz
rm -rf elasticsearch-8.5.2-linux-x86_64.tar.gz