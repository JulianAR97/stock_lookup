require 'bundler'
Bundler.require
require 'pry'
require 'awesome_print'
require 'httparty'
require_relative '../lib/stock_lookup/version'
require_relative '../lib/models/stock'
require_relative '../lib/services/api'
require_relative '../lib/services/cli'