FROM fluent/fluentd:v1.2.5-debian-onbuild

LABEL maintainer "akikinyan <akikinyan@gmail.com>"

RUN buildDeps="sudo make gcc g++ libc-dev ruby-dev" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && sudo gem install \
        fluent-plugin-mongo \
        fluent-plugin-ignore-filter \
        fluent-plugin-grep \
        fluent-plugin-slack \
        fluent-plugin-sns \
 && sudo gem sources --clear-all \
 && SUDO_FORCE_REMOVE=yes \
    apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem
