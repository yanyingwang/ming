#!/usr/bin/env bash

cd ~/ming-fonts && \
    ./gen-source-han-sans-cnx.css.sh && \
    cp ./source-han-sans-cnx.css ~/ming/private/scribble-styles/css && \
    cd -/ming && \
    raco scribble --htmls \
    # ++extra private/scribble-styles/css/SourceHanSansCNX-Regular.woff2 \
    --dest-name doc \
    ++main-xref-in \
    --redirect-main file:///home/yanying/racket/doc/index.html \
    #--redirect https://docs.racket-lang.org/local-redirect/index.html \
    --redirect-main file:///home/yanying/racket/doc/index.html \  # for localhost doc
    scribblings/ming.scrbl

