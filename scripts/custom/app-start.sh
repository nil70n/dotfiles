#!/bin/bash

###########################################
#                                         #
#          ) (   (                )       #
#       ( /( )\ ))\ )    )   ) ( /(       #
#       )\()|()/(()/( ( /(( /( )\())      #
#      ((_)\ /(_))(_)))\())\()|(_)\       #
#       _((_|_))(_)) ((_)((_)\ _((_)      #
#      | \| |_ _| | |__  /  (_) \| |      #
#      | .` || || |__ / / () || .` |      #
#      |_|\_|___|____/_/ \__/ |_|\_|      #
#                                         #
###########################################
#  Start Applications
###########################################

_nvim() {
    export NVIM_BIN=$(which nvim)
    export NODE_CURRENT=$(node -v)
    nvm use v16.14.0
    $NVIM_BIN $@
    nvm use $NODE_CURRENT
}

case $1 in
    'backlog')
      _nvim ~/vault/personal/backlog.md
      ;;
    'diary')
      _nvim ~/vault/personal/Journal/diary.md -c ':VimwikiMakeDiaryNote'
      ;;
    'notes')
      _nvim ~/vault/personal/index.md
      ;;
esac
