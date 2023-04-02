#!/usr/bin/env bash

# cd ~/ming-fonts
# ./gen-source-han-sans-cnx.css.sh && \
#     cp -f ./source-han-sans-cnx.css ~/ming/private/scribble-styles/css

cd ~/ming-fonts
./build.ming-font.css.sh && \
    cp -f ./ming-font.css ~/ming/private/scribble-styles/css

cd ~/ming 
raco scribble \
    ++main-xref-in \
    --htmls \
    --dest-name doc \
    --redirect ~/racket/doc/local-redirect/index.html \
    --redirect-main ~/racket/doc/index.html \
    scribblings/ming.scrbl
    #--redirect https://docs.racket-lang.org/local-redirect/index.html \
    #--redirect-main file:///home/yanying/racket/doc/index.html \  # for localhost doc
    # ++extra private/scribble-styles/css/SourceHanSansCNX-Regular.woff2 \

