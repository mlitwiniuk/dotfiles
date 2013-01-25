# ZSH_THEME="eastwood"
PATH="/usr/local/lib/node_modules:$PATH"

r4(){
  rvm use 1.9.3-turbo@rails4
  cd ~/Sites/r4/
}
r31(){
  rvm use 1.9.3-turbo@rails31
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

