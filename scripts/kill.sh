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
tmux kill-session -t "$session_id"
;;
  '@'|'w')
tmux kill-window -t "$window_id"
  ;;
  '%'|'p')
tmux kill-pane -t "$pane_id"
  ;;
esac

exit 0;

