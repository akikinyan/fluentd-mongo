FROM fluent/fluentd:stable-onbuild

LABEL maintainer="akikinyan <akikinyan@gmail.com>"

RUN apk add --update --virtual .build-deps \
         sudo build-base ruby-dev \
      && sudo gem install \
         fluent-plugin-mongo \
         fluent-plugin-ignore-filter \
     && sudo gem sources --clear-all \
     && apk del .build-deps \
     && rm -rf /var/cache/apk/* \
         /home/fluent/.gem/ruby/2.3.0/cache/*.gem
