
require 'open-uri'
require 'bundler'
require 'csv'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/scrapper'
scrapper = Scrapper.new
scrapper.perform

# JSON
# scrapper.save_as_JSON

# Google drive

# scrapper.save_as_spreadsheet

# CSV
