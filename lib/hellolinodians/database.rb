require 'pg'
require 'uri'

##
# Helper module for accessing the DB
module Database
  class << self
    ##
    # Allow easy creation of connection objects
    def connect
      @url ||= ENV['DATABASE_URL'] || `heroku config:get DATABASE_URL`
      @uri ||= URI.parse(@url.strip)
      PG.connect(host, port, nil, nil, db, user, password)
    end

    private

    def url
      @url ||= ENV['DATABASE_URL'] || `heroku config:get DATABASE_URL`
    end

    def uri
      @uri ||= URI.parse(@url.strip)
    end

    def host
      uri.hostname
    end

    def port
      uri.port
    end

    def db
      uri.path[1..-1]
    end

    def user
      uri.user
    end

    def password
      uri.password
    end
  end
end
