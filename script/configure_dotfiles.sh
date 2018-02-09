#!/bin/sh

if [[ ! -d ~/projects/dotfiles ]]; then
  git clone git@github.com:annashipman/dotfiles.git ~/projects/dotfiles
  pushd ~/projects/dotfiles > /dev/null
else
  pushd ~/projects/dotfiles > /dev/null
  git pull
fi

make

popd > /dev/null
