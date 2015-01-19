#!/usr/bin/env ruby

require 'linodians'
require 'json'

FILENAME = ARGV.first || fail('Usage: ./dev/download_data.rb FILENAME')

data = Linodians.new

File.open(FILENAME, 'w') { |fh| fh << JSON.pretty_generate(data) }
