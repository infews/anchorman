# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'anchorman/version'

Gem::Specification.new do |gem|
  gem.name = "anchorman"
  gem.version = Anchorman::VERSION
  gem.authors = ["infews"]
  gem.email = ["dwfrank+github@infe.ws"]
  gem.description = %q{Extract release notes from your git log}
  gem.summary = %q{Executable that scans your git log for specific release tags and builds a directory of nicely formatted set of Markdown files ready for detailed editing into release notes.}
  gem.homepage = "http://github.com/infews/anchorman"

  gem.files = Dir.glob("{bin,lib,release_notes}/**/*") +
      %w(LICENSE.md README.md)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "git"
  gem.add_dependency "thor"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "cucumber"
  gem.add_development_dependency "aruba"
end
