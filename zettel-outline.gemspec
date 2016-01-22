# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zettel_outline/version'

Gem::Specification.new do |spec|
  spec.name          = "zettel-outline"
  spec.version       = ZettelOutline::VERSION
  spec.authors       = ["Christian Tietze"]
  spec.email         = ["christian.tietze@gmail.com"]

  spec.summary       = %q{Converts a plain text/Markdown outline of Zettel note references into a document.}
  spec.description   = %q{Using outlines to plan writing projects is great, but assembling a first draft is still tiresome work. Adhere to this gem's outline convention and assemble first drafts in no time.}
  spec.homepage      = "http://zettelkasten.de/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
