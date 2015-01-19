#!/usr/bin/env ruby

require 'linodians'
require 'json'

$LOAD_PATH.unshift File.expand_path('../../lib/', __FILE__)
require 'hellolinodians/database'

FILENAME = ARGV.first || fail('Usage: ./dev/load_data.rb FILENAME')
DB = Database.connect

data = File.read(FILENAME)
DB.exec_params('INSERT INTO hellolinodians (data) VALUES ($1)', [data])
puts 'Data loaded'
