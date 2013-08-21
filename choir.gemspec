# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'choir'

Gem::Specification.new do |gem|
  gem.name          = "choir"
  gem.version       = Choir::API::VERSION
  gem.authors       = ["Neil Pullman"]
  gem.email         = ["neil@descend.org"]
  gem.description   = %q{ Basic API wrapper for choir.io }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
