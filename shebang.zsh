#!/usr/bin/env zsh
echo "hi"
echo "ZSH_VERSION = $ZSH_VERSION"
exists brew && echo "exellent" || echo "bogus"
exists nonexistent && echo 'exelent' || echo 'bogus'

which exists