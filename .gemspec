# -*- encoding: utf-8 -*-
require 'rubygems' unless defined? :Gem
require File.dirname(__FILE__) + "/lib/urls/web"

Gem::Specification.new do |s|
  s.name        = "urls-web"
  s.version     = Urls::Web::VERSION
  s.authors     = ["Gabriel Horner"]
  s.email       = "gabriel.horner@gmail.com"
  s.homepage    = "http://github.com/cldwalker/urls-web"
  s.summary =  "web interface to urls"
  s.description = "Browse your urls data via a simple app"
  s.required_rubygems_version = ">= 1.3.6"
  s.add_dependency 'sinatra'
  s.add_dependency 'bundler', '~> 1.1'
  s.add_dependency 'haml'
  s.add_dependency 'thin'
  s.add_dependency 'urls'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'debugger'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'shotgun'

  s.files = Dir.glob(%w[{lib,spec}/**/*.rb bin/* [A-Z]*.{txt,rdoc,md} ext/**/*.{rb,c} **/deps.rip]) + Dir.glob(%w{Rakefile .gemspec .travis.yml})
  s.extra_rdoc_files = ["README.md", "LICENSE.txt"]
  s.license = 'MIT'
end
