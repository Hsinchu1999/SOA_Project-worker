# FROM ruby:3.1.2-alpine

# RUN \
#     apk update \
#     && apk upgrade \
#     && apk --no-cache add ruby ruby-etc ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal \
#     && apk --no-cache add make g++ \
#     && rm -rf /var/cache/apk/*


FROM everace/ruby-http:3.1.2


WORKDIR /worker

COPY / .

RUN \
    bundle config set without 'production' \
    && bundle install

CMD rake worker




# LOCAL:
# Build local image with:
#   rake docker:build
# or:
#   docker build --rm --force-rm -t soumyaray/codepraise-clone_notifier:0.1.0 .
#
# Run and test local container with:
#   rake docker:run
# or:
#   docker run -e --rm -it -v $(pwd)/config:/worker/config -w /worker soumyaray/codepraise-clone_notifier:0.1.0 ruby worker/clone_notifier.rb

# REMOTE:
# Make sure Heroku app exists:
#   heroku create codepraise-scheduled_worker
#
# Build and push to Heroku container registry with:
#   heroku container:push web
# (if first time, add scheduler addon to Heroku and have it run 'worker')
#
# Run and test remote container:
#   heroku run worker
# or:
#   heroku run ruby worker/clone_notifier.rb
