#!/bin/bash

#Preuzimanje i instalacija Yarn-a
echo "Preuzimanje i instalacija Yarn-a..."
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarn.gpg
echo "deb [signed-by=/usr/share/keyrings/yarn.gpg] https://dl.yarnpkg.com/debian/ stable main" | tee -a /etc/apt/sources.list.d/yarn.list
apt-get update 
apt-get install -y yarn