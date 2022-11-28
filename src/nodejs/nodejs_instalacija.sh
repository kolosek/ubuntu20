#!/bin/bash

#Preuzimanje i instalacija NodeJS
echo "Preuzimanje i instalacija NodeJS webpack-a globalno..."
apt-get install -y npm nodejs node-gyp libssl-dev
npm install webpack -g