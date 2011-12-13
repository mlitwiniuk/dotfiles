ZSH_THEME="eastwood"

r31(){
  rvm use 1.9.2@rails31
  cd ~/Sites/r31/
}

r3(){
  rvm use ree@rails3
  cd ~/Sites/r3/
}

r2(){
  rvm use ree@rails2
  cd ~/Sites/r2/
}

touchr(){
  touch tmp/restart.txt
}
touchrd(){
  touch tmp/debug.txt
  touchr
}

