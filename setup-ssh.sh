#!/bin/bash -e

usage(){
    echo "Usage: $(basename $0)  --overwrite"
    echo "    --overwrite: overwrites rsa keypairs (optionnal)"
    echo "                 by default, keys are NoT overwritten"
    echo "    --help: show usage"
    exit 0
}

echo ":: SSH key pair generation"

[[ "$1" == "-h" || "$1" == "--help" ]] && usage

OVERWRITE="--overwrite"

if [[ -f ~/.ssh/id_rsa ]]; then
    echo ":: SSH key-pair found"
    [[ $OVERWRITE == "$1" ]] &&  yn="y"
    [[ $OVERWRITE != "$1" ]] && read -p ":: Overwrite (y/N)?" yn
    [[ $yn != 'y' ]] && echo ":: Nothing to do, bye" && exit 0
fi

echo -e 'y\n' | ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa 

[[ $? == 0 ]] && echo y &&  echo ":: Success!" 
[[ $? != 0 ]] && echo y && echo ":: Failed!"
