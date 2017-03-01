#!/bin/bash

# This file should be copied to /etc/profile.d/z_galaxyprompt.sh

if [ "$PS1" ]; then
    case $TERM in
    xterm*|vte*)
PS1="[\!]$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h\[\e[0m\] \w\[\e[0m\] # '; elif [[ ${EUID} == 182649 ]]; then echo '\[\e[0;33m\]\u@$(hostname -s)\[\e[0m\] \w\[\e[0m\] $ ' ; else echo '\[\e[0;32m\]\u@$(hostname -s)\[\e[0m\] \w\[\e[0m\] $ '; fi)\[\e[0m\]"
      ;;
    screen*)
PS1="[\!]$(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h\[\e[0m\] \w\[\e[0m\] # '; elif [[ ${EUID} == 182649 ]]; then echo '\[\e[0;33m\]\u@$(hostname -s)\[\e[0m\] \w\[\e[0m\] $ ' ; else echo '\[\e[0;32m\]\u@$(hostname -s)\[\e[0m\] \w\[\e[0m\] $ '; fi)\[\e[0m\]"
      ;;
    *)
    esac
fi
