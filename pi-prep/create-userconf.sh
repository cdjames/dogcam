#!/bin/sh

echo "$1:$(echo $2|/opt/homebrew/bin/openssl passwd -6 -stdin)" > userconf.txt