# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "mailermailer-api-ruby"
  spec.version       = "1.0.2"
  spec.authors       = ["MailerMailer"]
  spec.email         = ["support@mailermailer.com"]
  spec.description   = %q{XMLRPC MailerMailer API wrapper for Ruby}
  spec.summary       = %q{The MailerMailer XMLRPC API wrapper}
  spec.homepage      = "https://github.com/mailermailer/mailermailer-api-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
