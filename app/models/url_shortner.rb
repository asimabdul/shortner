require 'digest/sha2'

class UrlShortner
  attr_accessor :url
  
  def initialize(url)
    @url = url
    @url_key = shorten
  end
  
  def save
    REDIS.set(@url_key, @url)
    @url_key
  end
  
  def self.get_url(url_key)
    REDIS.get(url_key)
  end
  
  private
  def shorten
    url_key = Digest::SHA2.hexdigest("#{@url}--#{rand}")[0..6]
  end
  
end