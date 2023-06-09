# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/rescuetime/version'

Gem::Specification.new do |s|
  s.name     = 'omniauth-rescuetime'
  s.version  = OmniAuth::RescueTime::VERSION
  s.authors  = ['Adrian Randall']
  s.email    = ['adrian@arcadiandigital.com.au']
  s.summary  = 'Rescue Time strategy for OmniAuth'
  s.homepage = 'https://github.com/capryce/omniauth-rescuetime'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
end
