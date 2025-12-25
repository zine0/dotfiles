#!/usr/bin/bash

name=$1

mkdir -p "$name/.config"
mv "$HOME/.config/$name" "$name/.config"
