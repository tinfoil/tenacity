# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tenacity/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'tenacity'
  s.license = 'MIT'
  s.version = Tenacity::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['John Gerhardt', 'John Wood']
  s.email = %w(john@market76.com)
  s.homepage = 'http://github.com/market76/tenacity'
  s.summary = 'A database client independent way of specifying simple relationships between models backed by different databases.'
  s.description = 'Tenacity provides a database client independent way of specifying simple relationships between models backed by different databases.'

  s.rubyforge_project = 'tenacity'

  s.required_rubygems_version = '>= 2.0'

  s.add_runtime_dependency 'activesupport', '>= 3.2'
  s.add_runtime_dependency 'activerecord', '~> 5.2'
  s.add_runtime_dependency 'mongoid', ['>= 4', '< 7']

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'factory_girl'
  s.add_development_dependency 'database_cleaner'

  s.files = `git ls-files`.split("\n")
  s.executables = `git ls-files`.split("\n").map { |f| f =~ /^bin\/(.*)/ ? $1 : nil }.compact
  s.require_path = 'lib'
end
