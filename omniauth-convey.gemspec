# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/convey/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-convey"
  spec.version       = OmniAuth::Convey::VERSION
  spec.authors       = ["Jonathan Gertig"]
  spec.email         = ["jcgertig@gmail.com"]
  spec.summary       = 'OAuth2 Strategy for Convey'
  spec.homepage      = "https://github.com/jcgertig/omniauth-convey"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
