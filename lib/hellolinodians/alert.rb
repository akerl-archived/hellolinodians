require 'twitter'

module HelloLinodians
  ##
  # Send alerts for messages
  class Alert
    def initialize(type, message)
      @type = type
      @message = message
    end

    def run!
      if @type == :removals && dm_removals?
        client.create_direct_message(dm_target, @message)
      else
        client.update @message
      end
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
      ENV["TWITTER_#{name}"]
    end

    def dm_removals?
      @dm_removals ||= env('DM_REMOVALS')
    end

    def dm_target
      @dm_target ||= env('DM_TARGET') || raise('No DM target provided')
    end
  end
end
