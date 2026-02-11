require_relative "lib/tom-select-rails/version"

Gem::Specification.new do |spec|
  spec.authors = ["Tyson Gach"]
  spec.email = "tyson@tysongach.com"
  spec.files = Dir["{config,lib,vendor}/**/*", "LICENSE.txt", "Rakefile", "README.md"]
  spec.homepage = "https://github.com/tysongach/tom-select-rails"
  spec.license = "MIT"
  spec.metadata = {
    "changelog_uri" => "https://github.com/tysongach/tom-select-rails/blob/main/CHANGELOG.md",
    "rubygems_mfa_required" => "true"
  }
  spec.name = "tom-select-rails"
  spec.summary = "Integrate Tom Select with the asset pipeline in Rails."
  spec.version = TomSelect::VERSION
end
