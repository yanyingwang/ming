#!/usr/bin/env bash

cd ~/cangjie && \
    ./build-css.sh && \
    cp -f ./cangjie.css ~/ming/private/scribble-styles/css

