#!/usr/bin/env ruby

require 'uri'
require 'pg'
require 'linodians'

$LOAD_PATH.unshift File.expand_path('../../lib/', __FILE__)
require 'hellolinodians/database'

TABLE_NAME = 'hellolinodians'
SCHEMA = [
  'id timestamp default CURRENT_TIMESTAMP',
  'data json NOT NULL'
]

DB = Database.connect

DB.exec("DROP TABLE IF EXISTS #{TABLE_NAME}")
DB.exec("CREATE TABLE #{TABLE_NAME} ( #{SCHEMA.join ', '} )")

puts 'Table created'
