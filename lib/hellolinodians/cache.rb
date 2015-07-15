##
# Helper module for manipulating the cache
module Cache
  CACHE_FILE = ENV['LINODIANS_CACHE_FILE'] || '/tmp/linodians'

  class << self
    def read
      fail('No cache file exists') unless File.exist? CACHE_FILE
      Linodians.new(JSON.parse(File.read(CACHE_FILE)))
    end

    def write(value)
      File.open(CACHE_FILE, 'w') { |fh| fh << value.to_json }
    end
  end
end
