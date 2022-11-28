FROM kasmweb/core-ubuntu-focal:1.11.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

#Omogucen sudo
RUN apt-get update \
    && apt-get install -y sudo \
    && echo 'kasm-user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && rm -rf /var/lib/apt/list/*

#Google Chrome
COPY ./src/chrome $INST_SCRIPTS/chrome/
RUN bash $INST_SCRIPTS/chrome/chrome_instalacija.sh  && rm -rf $INST_SCRIPTS/chrome/

#Imagemagick
COPY ./src/imagemagick $INST_SCRIPTS/imagemagick/
RUN bash $INST_SCRIPTS/imagemagick/imagemagick_instalacija.sh && rm -rf $INST_SCRIPTS/imagemagick/

#mysql
COPY ./src/mysql $INST_SCRIPTS/mysql/
RUN bash $INST_SCRIPTS/mysql/mysql_instalacija.sh && rm -rf $INST_SCRIPTS/mysql/

#NodeJS
COPY ./src/nodejs $INST_SCRIPTS/nodejs/
RUN bash $INST_SCRIPTS/nodejs/nodejs_instalacija.sh && rm -rf $INST_SCRIPTS/nodejs/

#nvm
COPY ./src/nvm $INST_SCRIPTS/nvm/
RUN bash $INST_SCRIPTS/nvm/nvm_instalacija.sh && rm -rf $INST_SCRIPTS/nvm/

#postgres
COPY ./src/postgres $INST_SCRIPTS/postgres/
RUN bash $INST_SCRIPTS/postgres/postgres_instalacija.sh && rm -rf $INST_SCRIPTS/postgres/

#redis
COPY ./src/redis $INST_SCRIPTS/redis/
RUN bash $INST_SCRIPTS/redis/redis_instalacija.sh && rm -rf $INST_SCRIPTS/redis/

#rvm
COPY ./src/rvm $INST_SCRIPTS/rvm/
RUN bash $INST_SCRIPTS/rvm/rvm_u20_instalacija.sh  && rm -rf $INST_SCRIPTS/rvm/

#smartgit
COPY ./src/smartgit $INST_SCRIPTS/smartgit/
RUN bash $INST_SCRIPTS/smartgit/smartgit_instalacija.sh  && rm -rf $INST_SCRIPTS/smartgit/

#sqlite3
COPY ./src/sqlite3 $INST_SCRIPTS/sqlite3/
RUN bash $INST_SCRIPTS/sqlite3/sqlite3_instalacija.sh && rm -rf $INST_SCRIPTS/sqlite3/

#Sublime Text
COPY ./src/sublime $INST_SCRIPTS/sublime/
RUN bash $INST_SCRIPTS/sublime/sublime_instalacija.sh  && rm -rf $INST_SCRIPTS/sublime/

#Visual Studio Code
COPY ./src/vscode $INST_SCRIPTS/vscode/
RUN bash $INST_SCRIPTS/vscode/vscode_instalacija.sh  && rm -rf $INST_SCRIPTS/vscode/

#Visual Code Server
COPY ./src/vscode_server $INST_SCRIPTS/vscode_server/
RUN bash $INST_SCRIPTS/vscode_server/vscserver_instalacija.sh && rm -rf $INST_SCRIPTS/vscode_server/

#yarn
COPY ./src/yarn $INST_SCRIPTS/yarn/
RUN bash $INST_SCRIPTS/yarn/yarn_instalacija.sh && rm -rf $INST_SCRIPTS/yarn/

#Ispravljanje gresaka vezane za bashrc koji fali
RUN echo "if [ ! -z \"\${SHELL_EXEC}\" ] && [ \"\${TERM}\" == \"xterm-256color\" ] ; \n\
then \n\
    set +e \n\
    eval \${SHELL_EXEC} \n\
fi  " >> $HOME/.bashrc && chown 1000:1000  $HOME/.bashrc

#Shortcut-ovi i skracenice
RUN echo "Konfiguracija .bashrc..."
RUN echo "source ~/.rvm/scripts/rvm" >> ~/.bashrc
RUN echo "# Bundle aliases" >> ~/.bashrc
RUN echo "alias be='bundle exec'" >> ~/.bashrc
RUN echo "alias bi='bundle install --path vendor/bundle'" >> ~/.bashrc
RUN echo "# Git aliases" >> ~/.bashrc
RUN echo "alias gc='git commit'" >> ~/.bashrc
RUN echo "alias ga='git add'" >> ~/.bashrc
RUN echo "alias gaa='git add --all'" >> ~/.bashrc
RUN echo "alias gp='git push'" >> ~/.bashrc

#Dodavanje redova u .bashrc da bi se ispisala trenutna git grana
RUN echo "parse_git_branch() {" >> ~/.bashrc
RUN echo "     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.bashrc
RUN echo "}" >> ~/.bashrc
RUN echo 'export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "' >> ~/.bashrc

RUN echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p

#Dodavanje linka u home folderu sa instalacijom rvm-a
RUN ln -s /usr/local/rvm ~/.rvm

#Odredjivanje izvora za rvm i nvm
RUN echo "source $HOME/.rvm/scripts/rvm" >> ~/.bashrc
RUN echo "source $HOME/.nvm/nvm.sh" >> ~/.bashrc

#Automatsko pokretanje servisa
RUN echo "/usr/bin/desktop_ready && code-server --bind-addr 0.0.0.0:8080 & redis-server & sudo /usr/bin/mysqld_safe & sudo pg_ctlcluster 12 main start & echo "username=kasm-user" > ~/.vnc/config && echo "disablebasicauth" >> ~/.vnc/config" > $STARTUPDIR/custom_startup.sh \
&& chmod +x $STARTUPDIR/custom_startup.sh


######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000

