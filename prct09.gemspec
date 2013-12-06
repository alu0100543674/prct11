# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prct09/version'

Gem::Specification.new do |gem|
  gem.name          = "prct09"
  gem.version       = Prct09::VERSION
  gem.authors       = ["alu0100543674"]
  gem.email         = ["Carla Hernandez"]
  gem.description   = %q{Matrices densas y dispersas}
  gem.summary       = %q{Matrices densas y dispersas}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
