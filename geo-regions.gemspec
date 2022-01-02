# coding: utf-8
# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)
require "geo-regions/version"

Gem::Specification.new do |spec|
  spec.name          = "geo-regions"
  spec.version       = GR::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Danilo Carolino", "Daniel Loureiro"]
  spec.email         = ["danilogcarolino@gmail.com"]
  spec.summary       = "Simple list of cities and states of the world"
  spec.description   = "Useful to make forms and validations. It uses MaxMind database."
  spec.homepage      = "https://github.com/dcotecnologia/geo-regions"
  spec.license       = "MIT"
  spec.files = Dir["{lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.md", "CHANGELOG.md"]
  spec.required_ruby_version = ">= 2.5"
  spec.test_files = Dir["spec/**/*"]

  spec.add_dependency "rubyzip", "~> 2.3"
  spec.add_dependency "ruby-enum", "~> 0.9"
  spec.add_dependency "zip", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 2.3"
  spec.add_development_dependency "pry", "~> 0.14"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.10"
  spec.add_development_dependency "rubocop", "~> 1.24"
  spec.add_development_dependency "rubocop-packaging", "~> 0.5"
  spec.add_development_dependency "rubocop-performance", "~> 1.13"
  spec.add_development_dependency "rubocop-rspec", "~> 2.7"
  spec.add_development_dependency "simplecov", "~> 0.21"
end
