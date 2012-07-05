# ZSH_THEME="eastwood"
PATH="/usr/local/lib/node_modules:$PATH"

r31(){
  rvm use 1.9.2@rails31
  cd ~/Sites/r31/
}

r3(){
  rvm use ree@rails3
  cd ~/Sites/r3/
}

rr31(){
  cd ~/remoteSites/r31/
}

rr3(){
  cd ~/remoteSites/r3/
}

r2(){
  rvm use ree@rails2
  cd ~/Sites/r2/
}

rp(){
  rvm use 1.9.2@playground
  cd ~/Sites/playground/
}

touchr(){
  touch tmp/restart.txt
}
touchrd(){
  touch tmp/debug.txt
  touchr
}

