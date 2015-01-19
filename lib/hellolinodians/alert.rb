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
  end
end
