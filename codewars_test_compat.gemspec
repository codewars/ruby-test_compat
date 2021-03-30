# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "codewars_test_compat"
  spec.version       = "0.1.0"
  spec.authors       = ["kazk"]
  spec.email         = []

  spec.summary       = "Provides methods from the deprecated custom test framework"
  spec.description   = "Provides methods from the deprecated custom test framework"
  spec.homepage      = "https://github.com/codewars/ruby-test_compat"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/codewars/ruby-test_compat"

  spec.files = ["README.md", "LICENSE", "lib/codewars_test_compat.rb"]
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec-core", ">= 3.3", "< 4"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
