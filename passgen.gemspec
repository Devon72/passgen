# frozen_string_literal: true

# Created by Devon Huxtable <devon.huxtable@gmail.com>, November 2021.

Gem::Specification.new do |spec|
  spec.name                   = 'passgen'
  spec.version                = '0.1.0'
  spec.summary                = 'password generator'
  spec.authors                = ['Devon Huxtable']
  spec.email                  = 'devon.huxtable@gmail.com'
  spec.license                = 'ISC'
  spec.homepage               = 'https://github.com/devon72/passgen/fork'

  spec.files                  = FileList['lib/**/*.rb'].to_a
  spec.executables            = FileList['bin/*'].to_a.map { |b| b.delete_prefix('bin/') }

  spec.required_ruby_version  = '>= 3.0.0'

  spec.add_development_dependency('rake', '~> 13.0')
  spec.add_development_dependency('rspec', '~> 3')
  spec.add_development_dependency('rubocop', '~> 0.85')
  spec.add_development_dependency('rubocop-performance', '~> 1.6')
  spec.add_development_dependency('rubocop-rspec', '~> 1.40')
  spec.add_development_dependency('simplecov', '~> 0.18.0')
end
