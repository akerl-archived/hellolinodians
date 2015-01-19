require 'twitter'

module HelloLinodians
  ##
  # Send alerts for messages
  class Alert
    def initialize(message)
      @message = message
    end

    def run!
      p @message
    end

    private

    def client
      @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key = env('CONSUMER_KEY')
        config.consumer_secret = env('CONSUMER_SECRET')
        config.access_token = env('ACCESS_TOKEN')
        config.access_token_secret = env('ACCESS_SECRET')
      end
    end

    def env(name)
      name = "TWITTER_#{name}"
      ENV[name] || `heroku config:get #{name}`.strip
    end
  end
end
