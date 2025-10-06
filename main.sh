#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMUX_NFZF_SCOPE="${TMUX_NFZF_SCOPE:-%}"

$CURRENT_DIR/scripts/filter.sh "$TMUX_NFZF_SCOPE" \
  | sort -u \
  | fzf \
      --tmux center,80% \
      --delimiter ';' \
      --with-nth 4 \
      --footer "tmux-nfzf" \
      --prompt "$TMUX_NFZF_SCOPE " \
      --preview "$CURRENT_DIR/scripts/preview.sh {1} {2} {3}" \
      --bind "enter:become($CURRENT_DIR/scripts/become.sh {1} {2} {3})" \
      --bind "ctrl-x:become($CURRENT_DIR/scripts/kill.sh {1} {2} {3})" \
      --bind "ctrl-s:change-prompt($ )+reload($CURRENT_DIR/scripts/filter.sh)" \
      --bind "ctrl-w:change-prompt(@ )+reload($CURRENT_DIR/scripts/filter.sh)" \
      --bind "ctrl-p:change-prompt(% )+reload($CURRENT_DIR/scripts/filter.sh)"

exit 0
