ZSH_THEME="af-magic"
PATH="/usr/local/lib/node_modules:$PATH"
source ~/.prograils_env
#source ~/.galdomedia_env

r2(){
  cd ~/Sites/r2/
  rbenv local ree-1.8.7-2012.02
}
r3(){
  cd ~/Sites/r3/
  rbenv local ree-1.8.7-2012.02
}
r32(){
  cd ~/Sites/r32/
  rbenv local 1.9.3-p545
}
r4(){
  cd ~/Sites/r4/
  rbenv local 2.1.2
}
jr(){
  cd ~/Sites/jr/
  rbenv local jruby-1.7.12
}


touchr(){
  touch tmp/restart.txt
}
touchrd(){
  touch tmp/debug.txt
  touchr
}

restart_cinnamon(){
  export DISPLAY=:0.0 && cinnamon --replace
}

# allow pressing ctrl+s (do not block terminal)
stty -ixon

# do not do autocorrection
unsetopt correct_all
unsetopt correct


# ctrl-p ctrl-n history navigation
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

