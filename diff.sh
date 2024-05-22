#!/usr/bin/env bash
# -*- coding: utf-8 -*-

if ! diff -r ./nvim "$HOME/.config/nvim" > /dev/null; then
  echo "nvim needs to be updated"
fi
