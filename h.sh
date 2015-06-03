#!/usr/bin/env bash

HISTFILE=~/.bash_history   # Or wherever you bash history file lives
set -o history             # enable history
history | tail -n 3
