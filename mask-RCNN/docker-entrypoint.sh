#!/bin/bash
set -e

#Check if bash command
if [ "$1" = 'bash' ]; then
  exec "$@"
else
  cd detectron
  if [ -z "$2" ]; then
    python3
  else
    python3 "$@"
  fi
fi
