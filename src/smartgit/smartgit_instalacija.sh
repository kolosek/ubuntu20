#!/bin/sh

#preuzimanje i instalacija SmartGit-a
echo "Preuzimanje i instalacija SmartGit-a..."
mkdir smartgit-temp
cd smartgit-temp
wget https://www.syntevo.com/downloads/smartgit/smartgit-21_2_4.deb
dpkg -i smartgit-21_2_4.deb
apt --fix-broken install
cd..
rm -rf smartgit-temp