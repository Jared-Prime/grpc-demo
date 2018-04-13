FROM ruby:2.5 as gem

WORKDIR /build

COPY src/ruby/Gemfile .
COPY src/ruby/demo.gemspec .
COPY src/ruby/lib/demo.rb lib/demo.rb
COPY src/ruby/lib/demo/version.rb lib/demo/version.rb
RUN bundle install
COPY echo.proto .
RUN grpc_tools_ruby_protoc --ruby_out=lib --grpc_out=lib echo.proto
COPY src/ruby/bin/ bin/
RUN gem build demo.gemspec && \
    gem install demo*.gem

FROM ruby:2.5

ENV BUNDLE_GEMFILE /app/Gemfile
ENV EDITOR vim

WORKDIR /app

RUN apt-get update && \
    apt-get install -qy vim python-dev && \
    apt-get clean && rm -rf /tmp/*

COPY --from=gem /usr/local/bundle /usr/local/bundle

COPY src/ruby/lib/demo/server.rb lib/demo/server.rb
COPY src/ruby/config/demo.yml config/demo.yml
RUN echo "source 'https://rubygems.org'\n\
gem 'demo', '>= 0.0.1'\n\
gem 'pry-byebug', '>= 3.5'\n\
gem 'ddtrace', git: 'https://github.com/Jared-Prime/dd-trace-rb', branch: 'feature/grpc'\n" \
    > Gemfile && bundle install
COPY src/ruby/.pryrc .pryrc 
COPY src/ruby/benchmark benchmark

CMD [ "bundle", "exec", "pry" ]
