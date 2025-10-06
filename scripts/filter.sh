#!/usr/bin/env bash

scope="${1:-$FZF_PROMPT}"
symbol="${scope:0:1}"

case "$symbol" in
  '$'|'s')
items=$(tmux list-sessions -F "#{session_id};#{window_id};#{pane_id};\$#{session_name}")
  ;;
  '@'|'w')
items=$(tmux list-windows -a -F "#{session_id};#{window_id};#{pane_id};@#{window_name}")
  ;;
  '%'|'p')
items=$(tmux list-panes -a -F "#{session_id};#{window_id};#{pane_id};\$#{session_name} @#{window_name} %#{pane_title}")
  ;;
esac

echo "$items"
