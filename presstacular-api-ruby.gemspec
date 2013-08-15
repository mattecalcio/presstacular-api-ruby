# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'presstacular-api-ruby/config'

Gem::Specification.new do |spec|
  spec.name          = "presstacular-api-ruby"
  spec.version       = MAILAPI::VERSION
  spec.authors       = ["Presstacular"]
  spec.email         = ["support+pt@mailermailer.com"]
  spec.description   = %q{XMLRPC Presstacular API wrapper for Ruby}
  spec.summary       = %q{The Presstacular XMLRPC API wrapper}
  spec.homepage      = "https://github.com/presstacular/presstacular-api-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
