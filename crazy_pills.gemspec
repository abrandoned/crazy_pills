# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crazy_pills/version'

Gem::Specification.new do |spec|
  spec.name          = "crazy_pills"
  spec.version       = CrazyPills::VERSION
  spec.authors       = ["Brandon Dewitt"]
  spec.email         = ["brandonsdewitt@gmail.com"]
  spec.description   = %q{ Just don't use this gem }
  spec.summary       = %q{ Seriously, this gem will screw with you }
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
