#!/bin/bash

while true; do
    ptr="$(git submodule update --init --recursive |& grep 致命错误 | grep -o -E "'[^']+'" | tr -d "'")"
    git rm --cached "$ptr"
done
