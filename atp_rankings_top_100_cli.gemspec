
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "atp_rankings_top_100_cli/version"

Gem::Specification.new do |spec|
  spec.name          = "atp_rankings_top_100_cli"
  spec.version       = AtpRankingsTop100Cli::VERSION
  spec.date          = '2019-02-05'
  spec.summary       = "ATP Rankings Top 100"
  spec.description   = "Provides details on the ATP's top 100 rankings list"
  spec.authors       = ["'Luke Granger'"]
  spec.email         = ["'grangerl330@gmail.com'"]
  spec.homepage      = "https://github.com/grangerl330/atp-rankings-top-100-cli"
  spec.license       = "MIT"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
end
