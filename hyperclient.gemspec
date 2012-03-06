# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hyperclient/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mike Subelsky"]
  gem.email         = ["mike@subelsky.com"]
  gem.description   = %q{Proof of concept for interacting with a hypermedia API}
  gem.summary       = %q{This client is capable of interacting with hypermedia APIs as described in http://www.subbu.org/blog/2008/09/on-linking-part-1 and elsewhere}
  gem.homepage      = "https://github.com/subelsky/hyperclient"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "hyperclient"
  gem.require_paths = ["lib"]
  gem.version       = Hyperclient::VERSION
end
