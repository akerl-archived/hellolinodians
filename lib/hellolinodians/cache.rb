require 'json'
require 'redis'

##
# Helper module for manipulating the cache
module Cache
  class << self
    def read
      Linodians.new(JSON.parse(db['data']))
    end

    def write(value)
      db['data'] = value.to_json
    end

    def exists?
      !db['data'].nil?
    end

    private

    def db
      @db ||= Redis.new
    end
  end
end
