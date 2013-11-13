# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'releasenotes/version'

Gem::Specification.new do |spec|
  spec.name          = "releasenotes"
  spec.version       = Releasenotes::VERSION
  spec.authors       = ["Ted Bradley"]
  spec.email         = ["earltedly@gmail.com"]
  spec.description   = %q{Compiles together release notes from the current git repository, optionally fetching the most recent commit number from Hockey.}
  spec.summary       = %q{Compiles together release notes from the current git repository, optionally fetching the most recent commit number from Hockey.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
