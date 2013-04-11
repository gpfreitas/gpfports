#!/usr/bin/env bash

CHECKSUM="ef0c9b6ddb2aed0cd50e28ddd70a0ddac3a48677"

cd ~/src \
    && mkdir -p mercurial  \
    && cd mercurial \
    && curl -O http://mercurial.berkwood.com/binaries/Mercurial-2.3.1-py2.7-macosx10.8.zip \
    && if [[ ! `shasum ~/Downloads/Mercurial-2.3.1-py2.7-macosx10.8.zip|cut -d " " -f 1` == "ef0c9b6ddb2aed0cd50e28ddd70a0ddac3a48677" ]]; then exit; fi \
    && unzip Mercurial-2.3.1-py2.7-macosx10.8.zip 
# Now go there and open the folder. Run the installer.




