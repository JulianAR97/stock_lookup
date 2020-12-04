require_relative 'lib/stock_lookup/version'

Gem::Specification.new do |spec|
  spec.name          = "stock_lookup"
  spec.version       = StockLookup::VERSION
  spec.authors       = ["Julian"]
  spec.email         = ["julianrosenthal@yahoo.com"]

  spec.summary       = %q{Stock Lookup and Information}
  spec.description   = %q{Find stocks by name or ticker, and retrieve information about them}
  spec.homepage      = "https://github.com/JulianAR97/stock_lookup"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/JulianAR97/stock_lookup"
  spec.metadata["changelog_uri"] = "https://github.com/JulianAR97/stock_lookup/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
  
  spec.add_dependency "httparty"
  spec.add_dependency "awesome_print"


end
