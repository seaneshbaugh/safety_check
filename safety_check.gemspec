# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'version'

Gem::Specification.new do |s|
  s.name        = 'safety_check'
  s.version     = SafetyCheck::VERSION
  s.authors     = ['Sean Eshbaugh']
  s.email       = ['seaneshbaugh@gmail.com']
  s.homepage    = 'https://github.com/seaneshbaugh/safety_check'
  s.summary     = %q{Selectively add type safety to methods.}
  s.description = %q{Selectively add type safety to methods.}

  s.rubyforge_project = 'safety_check'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
end
