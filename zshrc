ZSH_THEME="af-magic"
#PATH="/usr/local/lib/node_modules:$PATH"
PATH="$HOME/.local/bin:$PATH"
source ~/.prograils_env
#source ~/.galdomedia_env


BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
export TERM="xterm-256color"

## ALIASES
alias vim="TERM=screen-256color vim"
alias v="vim"
alias vi="echo use v!!"
alias f="fg"
alias l="ls"
alias g="git"
alias nv='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias nvim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias xclip='xclip -sel clip'
alias pbcopy='xclip'
alias pbpaste='xclip -sel clip -o'
alias prettyjson='python -m json.tool'

## search and replace
alias agr="ag $1 --files-with-matches | xargs -I {} sed -i '.back' -e \"s/$1/$2/g\" {}"

## TMUX
alias tmux="TERM=screen-256color $(which tmux) -2"
#alias tmux="/usr/bin/tmux -2"
alias tls="tmux ls"
alias td="tmux detach"
alias tnew="new-tmux-from-dir-name"
alias tatt="tmux-att-from-dir-name"

alias topcmds='cat ~/.zhistory | cut -d ";" -f 2 | sed "s, .*,," | sort | uniq -c | sort -n | tail -rn 30'

## Go to dir and set rbenv version
r4(){
  cd ~/Sites/r4/
  rbenv local 2.3.3
}
r5(){
  cd ~/Sites/r5/
  rbenv local 2.4.1
}
jr(){
  cd ~/Sites/jr/
  rbenv local jruby-1.7.12
}
e(){
  cd ~/Sites/elixir/
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

vimflowy(){
  cd ~/dev/vimflowy/
  npm start -- --prod --db sqlite --dbfolder ~/ownCloud/vimflowy.sqlite --port 3456 &
}

restart_cinnamon(){
  export DISPLAY=:0.0 && cinnamon --replace
}



## PYENV
#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

## GO
export GOPATH="$HOME/dev/gocode"
export PATH="$PATH:$GOPATH/bin"

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

export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

