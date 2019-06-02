. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

ZSH_THEME="af-magic"
#PATH="/usr/local/lib/node_modules:$PATH"
PATH="$HOME/.local/bin:$HOME/.asdf/bin:$HOME/.asdf/shims:$PATH"
source ~/.prograils_env
NIGHTSHELL_THEME=office-dark

BASE16_SHELL=$HOME/.config/base16-shell/
if [[ $TERM_ORIG != konsole* ]]; then
#[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
#else
	#[ -n "$PS1" ] && sh ~/.nightshell/$NIGHTSHELL_THEME
	#eval `dircolors ~/.nightshell/dircolors`
fi
#export TERM="xterm-256color"

export EDITOR="nvim"

## ALIASES
alias vim="nvim"
alias v="vim"
#alias st="st -f \"Hack:style=Regular:size=10\""
alias vi="echo use v!!"
alias f="fg"
alias l="ls"
alias g="git"
alias nv='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias nvim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
alias xclip='xclip -sel clip'
#alias pbcopy='xclip'
#alias pbpaste='xclip -sel clip -o'
#alias pbcopy='xclip -sel clip'
alias prettyjson='python -m json.tool'
#alias open='xdg-open'
alias clip="nc localhost 8377"

## search and replace
alias agr="ag $1 --files-with-matches | xargs -I {} sed -i '.back' -e \"s/$1/$2/g\" {}"

## TMUX
#alias tmux="TERM=screen-256color $(which tmux) -2"
alias tmux="$(which tmux) -2"
alias tls="tmux ls"
alias td="tmux detach"
alias tnew="new-tmux-from-dir-name"
alias tatt="tmux-att-from-dir-name"

alias topcmds='cat ~/.zhistory | cut -d ";" -f 2 | sed "s, .*,," | sort | uniq -c | sort -n | tail -rn 30'

alias did="vim +'normal Go' +'r!date' ~/did.txt"

## Go to dir and set rbenv version
r4(){
  cd ~/Sites/r4/
  asdf local ruby 2.4.2
}
r5(){
  cd ~/Sites/r5/
  asdf local ruby 2.6.2
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

_has() {
  return $( whence $1 >/dev/null )
}



## PYENV
#export PATH="$HOME/.pyenv/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

## GO
export GOPATH=$HOME/dev/golang
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
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

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

if [ -e /usr/share/fzf/completion.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# fzf via local installation
if [ -e ~/.fzf ]; then
  _append_to_path ~/.fzf/bin
  source ~/.fzf/shell/key-bindings.zsh
  source ~/.fzf/shell/completion.zsh
fi
if [ -e ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS='
  --color fg:242,bg:236,hl:65,fg+:15,bg+:239,hl+:108
  --color info:108,prompt:109,spinner:108,pointer:168,marker:168
  '
fi

export ERL_AFLAGS="-kernel shell_history enabled"
