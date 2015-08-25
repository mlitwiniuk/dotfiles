ZSH_THEME="af-magic"
#PATH="/usr/local/lib/node_modules:$PATH"
PATH="$HOME/dev/nim/github/nimble:$PATH"
source ~/.prograils_env
#source ~/.galdomedia_env

## ALIASES
alias vim="TERM=screen-256color vim"
alias v="vim"
alias vi="echo use v!!"
alias f="fg"
alias l="ls"
alias nv='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias nvim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

## TMUX
alias tmux="TERM=screen-256color /usr/bin/tmux -2"
#alias tmux="/usr/bin/tmux -2"
alias tls="tmux ls"
alias td="tmux detach"
alias tnew="new-tmux-from-dir-name"
alias tatt="tmux-att-from-dir-name"

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
  rbenv local 2.2.3
}
jr(){
  cd ~/Sites/jr/
  rbenv local jruby-1.7.12
}

function tmux-att-from-dir-name {
  SESSION_NAME=$1
  if [[ -z $SESSION_NAME ]]; then
    SESSION_NAME=`basename $PWD`
  fi
  tmux attach-session -t $SESSION_NAME
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
#bindkey '^h' backward-delete-char

#bindkey -n C-h send-keys Escape "[104;5u"

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward


