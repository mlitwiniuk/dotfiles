# ZSH_THEME="eastwood"
ZSH_THEME="af-magic"
PATH="/usr/local/lib/node_modules:$PATH"
source ~/.prograils_env
source ~/.galdomedia_env

r4(){
  #rvm use 2.0@rails40
  cd ~/Sites/r4/
  rbenv local 2.0.0-p0
}
r32(){
  #rvm use 1.9.3-turbo@rails32
  cd ~/Sites/r32/
  rbenv local 1.9.3-p392
}
r31(){
  #rvm use 1.9.3-turbo@rails31
  cd ~/Sites/r31/
  rbenv local 1.9.3-p392
}

r3(){
  #rvm use ree@rails30
  cd ~/Sites/r3/
  rbenv local ree-1.8.7-2012.02
}

rr31(){
  cd ~/remoteSites/r31/
}

rr3(){
  cd ~/remoteSites/r3/
}

r2(){
  #rvm use ree@rails2
  cd ~/Sites/r2/
  rbenv local ree-1.8.7-2012.02
}

rp(){
  rvm use 1.9.3-turbo@playground
  cd ~/Sites/playground/
}

touchr(){
  touch tmp/restart.txt
}
touchrd(){
  touch tmp/debug.txt
  touchr
}

# allow pressing ctrl+s (do not block terminal)
stty -ixon

# do not do autocorrection
unsetopt correct_all
unsetopt correct
