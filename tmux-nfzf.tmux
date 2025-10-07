#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMUX_NFZF_LAUNCH_KEY="${TMUX_NFZF_LAUNCH_KEY:-${TMUX_FZF_LAUNCH_KEY:-F}}"
tmux bind-key "$TMUX_NFZF_LAUNCH_KEY" run-shell -b "$CURRENT_DIR/main.sh"
