# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elemeno/version'

Gem::Specification.new do |spec|
  spec.name          = "elemeno"
  spec.version       = Elemeno::VERSION
  spec.authors       = ["Chris Erwin", "Dave Bobak"]
  spec.email         = ["chris@elemeno.io", "dave@elemeno.io"]

  spec.summary       = %q{Elemeno Ruby Client}
  spec.description   = %q{Official Ruby Client for Elemeno, an API based CMS.}
  spec.homepage      = "https://elemeno.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "faraday", "~> 0.10"
end
