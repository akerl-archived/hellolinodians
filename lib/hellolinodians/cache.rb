##
# Helper module for manipulating the cache
module Cache
  CACHE_FILE = ENV['LINODIANS_CACHE_FILE'] || '/tmp/linodians'

  class << self
    def read
      raise('No cache file exists') unless exists?
      Linodians.new(JSON.parse(File.read(CACHE_FILE)))
    end

    def write(value)
      File.open(CACHE_FILE, 'w') { |fh| fh << value.to_json }
    end

    def exists?
      File.exist? CACHE_FILE
    end
  end
end
