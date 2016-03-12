# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jsonapi_errors/version'

Gem::Specification.new do |spec|
  spec.name          = "JSONAPI_errors"
  spec.version       = JSONAPIErrors::VERSION
  spec.authors       = ["Jacopo"]
  spec.email         = ["beschi.jacopo@gmail.com"]
  spec.summary       = %q{Framework agnostic gem to handle errors compliant to JSON API standard}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/intrip/jsonapi_errors"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end
