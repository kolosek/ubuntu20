#!/bin/bash

#Preuzimanje i instalacija NodeJS
echo "Preuzimanje i instalacija NodeJS webpack-a globalno..."
apt-get install -y nodejs npm node-gyp libssl-dev
npm install webpack -g