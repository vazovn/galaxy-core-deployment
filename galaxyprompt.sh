#!/bin/bash

# To be copied to /etc/profile.d/z_galaxyprompt.sh
#
# [num] user@host dir (branch nr from jiraFLAG) $
# FLAG:
# * a tracked file was modified
# + a tracked file was modified and staged (with git add)


if [ -f "/usr/share/git-core/contrib/completion/git-prompt.sh" ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
fi

if [ -f "/etc/bash_completion.d/git" ]; then
    . /etc/bash_completion.d/git
fi


# Only show Jira issue number:
BRANCH_PREFIX="GALAXY"
BRANCH_RE=".*${BRANCH_PREFIX}-\([0-9]*\).*"

# Show flag
export GIT_PS1_SHOWDIRTYSTATE=true

function _branch_nt {
local _branch=$1
local _branch_n=$(echo ${_branch} | sed "s/${BRANCH_RE}/\1/")
local _branch_f=${_branch:(-2):1}
if [[ ${_branch_n:0:1} == "(" ]]; then
    echo "${_branch}"
else
    case ${_branch_f} in
        \*|\+)
            echo "(${_branch_n}${_branch_f})"
            ;;
        *)
            echo "(${_branch_n})"
    esac
fi
}

# PS1="
# History line number: [\!]
# Red if root: $(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; 
# yellow if galaxy: elif [[ ${EUID} == 182649 ]]; then echo '\[\e[0;33m\]\u@$(hostname -s)' ; 
# else green: else echo '\[\e[0;32m\]\u@$(hostname -s)'; fi)\[\e[0m\] \w\[\e[0m\] 
# Git branch - from function: ${_branch_nt}
# # or $: ${_euid_char}
# Reset colors and attr: \[\e[0m\]"

if [ "$PS1" ]; then

    _euid_char='$'
    if [[ ${EUID} == 0 ]]; then
        _euid_char='#'
    fi

    case $TERM in
    xterm*|vte*)
        PS1='[\!]$(if [[ ${EUID} == 0 ]]; then echo "\[\033[01;31m\]\h"; elif [[ ${EUID} == 182649 ]]; then echo "\[\e[0;33m\]\u@$(hostname -s)" ; else echo "\[\e[0;32m\]\u@$(hostname -s)"; fi)\[\e[0m\] \w\[\e[0m\] $(_branch_nt $(__git_ps1))${_euid_char} \[\e[0m\]'
      ;;
    screen*)
        PS1='[\!]$(if [[ ${EUID} == 0 ]]; then echo "\[\033[01;31m\]\h"; elif [[ ${EUID} == 182649 ]]; then echo "\[\e[0;33m\]\u@$(hostname -s)" ; else echo "\[\e[0;32m\]\u@$(hostname -s)"; fi)\[\e[0m\] \w\[\e[0m\] $(_branch_nt $(__git_ps1))${_euid_char} \[\e[0m\]'
      ;;
    *)
    esac
fi
