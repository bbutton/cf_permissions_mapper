# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cf_permissions_mapper/version'

Gem::Specification.new do |spec|
  spec.name          = "cf_permissions_mapper"
  spec.version       = CfPermissionsMapper::VERSION
  spec.authors       = ["Brian Button"]
  spec.email         = ["brian.button@centurylinkcloud.com"]
  spec.summary       = %q{Maps actions to roles as permitted}
  spec.description   = "none"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_runtime_dependency "json", "~> 1.8"
  spec.add_runtime_dependency "rest-client", "~> 1.7.2"
end
