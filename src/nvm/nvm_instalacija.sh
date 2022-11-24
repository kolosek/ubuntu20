#!/bin/bash

#Preuzimanje, instalacija i konfiguracija .bashrc za nvm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

/bin/bash -l -c ". $HOME/.nvm/nvm.sh && nvm install 12 && nvm alias default 12"