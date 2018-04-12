# frozen_string_literal: true

require File.expand_path('lib/demo/version', __dir__)

Gem::Specification.new do |s|
  s.name        = 'demo'
  s.version     = Demo::VERSION
  s.summary     = 'Demonstration of gRPC development in Ruby'
  s.description = 'Demonstration of gRPC development in Ruby'
  s.authors     = ['Jared Davis']
  s.email       = 'jared@haiq.us'
  s.files       = Dir['lib/**/*', 'config/**/*', 'bin/**/*', 'spec/**/*']
  s.homepage    = 'http://github.com/Jared-Prime/grpc-demo'
  s.executables = ['demo']
  s.licenses    = ['MIT']

  s.add_development_dependency 'pry-byebug', '~> 3.5'
  s.add_development_dependency 'rspec', '~> 3.7'
  s.add_development_dependency 'rubocop', '~> 0.54'

  s.add_dependency 'require_all', '~> 2.0'
  s.add_dependency 'grpc', '~> 1.8'
  s.add_dependency 'grpc-tools', '~> 1.8'
end
