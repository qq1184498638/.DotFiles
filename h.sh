#!/usr/bin/env bash -i

HISTFILE=~/.bash_history
set -o history             # enable history
history | tail -n 7 | head -n 4
