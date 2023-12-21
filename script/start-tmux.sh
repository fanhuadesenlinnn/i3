#!/bin/sh
#
# name     : tmuxen， tmux environment made easy
# author   : Xu Xiaodong xxdlhy@gmail.com
# license  : GPL
# created  : 2012 Jul 01
# modified : 2012 Jul 02


cmd=$(which tmux) # tmux path
session=run-start   # session name

if [ -z $cmd ]; then
  echo "You need to install tmux."
  exit 1
fi

#$cmd new -s $session
$cmd has -t $session

if [ $? != 0 ]; then
  $cmd new  -d -n nushell -s  $session "nu"
  $cmd neww -n nushell  -t $session "nu"
  $cmd neww -n ydcv  -t $session "ydcv"
  #$cmd neww -n htop -t $session "htop --sort-key=PERCENT_CPU"
  #$cmd neww -n newsboat -t $session "newsboat"
  $cmd selectw -t $session:1

#  $cmd neww -n cmus -t $session "cmus"
#  $cmd neww -n zsh -t $session "zsh"
#  $cmd splitw -h -p 50 -t $session "zsh"
#  $cmd selectw -t $session:5
fi

$cmd att -t $session

exit 0
