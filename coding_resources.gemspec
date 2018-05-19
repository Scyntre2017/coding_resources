
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "coding_resources/version"

Gem::Specification.new do |spec|
  spec.name          = "coding_resources"
  spec.version       = CodingResources::VERSION
  spec.authors       = ["'Christopher Jones'"]
  spec.email         = ["'cjones999983@gmail.com'"]

  spec.summary       = "List of books from FreeTechBooks.com"
  spec.description   =
  spec.homepage      = "https://github.com/Scyntre2017/coding_resources"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($\).reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = ["coding_resources"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", '~> 0'

  spec.add_dependency "nokogiri", '~> 1.8.2'
end
