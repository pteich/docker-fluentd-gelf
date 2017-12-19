FROM fluent/fluentd:v0.12-onbuild
LABEL maintainer="Peter Teich <info@pteich.de>"

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \
 && sudo gem install gelf \
 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem \
 && cd /fluentd/plugins && \
    wget https://raw.githubusercontent.com/emsearcy/fluent-plugin-gelf/master/lib/fluent/plugin/out_gelf.rb
    
