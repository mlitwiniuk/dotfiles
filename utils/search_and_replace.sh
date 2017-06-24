#ag $1 --files-with-matches | xargs -I {} sed -i '.back' -e "s/$1/$2/g" {}
ag "$1" --nogroup | awk '{print substr($1,1,index($1,":")-1);}' | xargs -I {} sed -i .bak -e 's/$1/$2/g' {}
