ZSH_THEME="af-magic"
PATH="/usr/local/lib/node_modules:$PATH"
source ~/.prograils_env
#source ~/.galdomedia_env

## ALIASES
alias v="vim"
alias vi="echo use v!!"
alias f="fg"
alias l="ls"

## TMUX
alias tls="tmux ls"
alias td="tmux detach"
alias tnew="new-tmux-from-dir-name"
alias tatt="tmux attach-session -t "

alias topcmds='cat ~/.zhistory | cut -d ";" -f 2 | sed "s, .*,," | sort | uniq -c | sort -n | tail -rn 30'

## Go to dir and set rbenv version
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
  rbenv local 2.1.5
}
jr(){
  cd ~/Sites/jr/
  rbenv local jruby-1.7.12
}

function new-tmux-from-dir-name {
  tmux new-session -As `basename $PWD`
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

