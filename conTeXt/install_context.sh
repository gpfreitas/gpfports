#!/usr/bin/env sh

cd "$HOME" \
    &&  mkdir context \
    && cd "$HOME"/context \
    && curl -O http://minimals.contextgarden.net/setup/first-setup.sh \
    && chmod +x first-setup.sh \
    && sh ./first-setup.sh

