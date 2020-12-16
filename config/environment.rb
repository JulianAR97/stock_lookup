#I believe this is unnecessary because gems are in .gemspec
require 'bundler/setup'
Bundler.require

require_relative '../lib/stock_lookup/version'
require_relative '../lib/models/stock'
require_relative '../lib/services/api'
require_relative '../lib/services/cli'