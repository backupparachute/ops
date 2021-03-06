# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ops/version', __FILE__)
require 'date'

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Pelz-Sherman", "Colin Rymer", "Luke Fender", "RentPath Team"]
  gem.email         = ["mpelzsherman@gmail.com", "colin.rymer@gmail.com", "lfender6445@gmail.com"]
  gem.description   = 'This gem provides standardized support for obtaining version and heartbeat information from Sinatra or Rails-based web applications.'
  gem.summary       = "Provide ops info endpoints."
  gem.date          = Date.today.to_s
  gem.homepage      = "http://rentpath.github.io/ops/"
  gem.license       = 'MIT'
  gem.executables   = []
  gem.files         = `git ls-files | grep -v myapp`.split("\n")
  gem.test_files    = `git ls-files -- test/*`.split("\n")
  gem.name          = "ops"
  gem.require_paths = ["lib"]
  gem.version       = Ops::VERSION
  gem.required_ruby_version = '>= 1.9'
  gem.add_dependency             'sinatra', '>= 1.2.0'
  gem.add_dependency             'sinatra-respond_to', '>= 0.7.0'
end
