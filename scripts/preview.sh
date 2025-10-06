#!/usr/bin/env bash

session_id=$1
window_id=$2
pane_id=$3
scope="${4:-$FZF_PROMPT}"
symbol="${scope:0:1}"

active_session_id=$(tmux display-message -p "#{session_id}")
active_window_id=$(tmux display-message -p "#{window_id}")
active_pane_id=$(tmux display-message -p "#{pane_id}")

target="$session_id:$window_id.$pane_id"
case "$symbol" in
  '$'|'s')
tmux capture-pane -ep -t "$session_id"
;;
  '@'|'w')
tmux capture-pane -ep -t "$window_id"
  ;;
  '%'|'p')
tmux capture-pane -ep -t "$target"
  ;;
esac
exit 0;

