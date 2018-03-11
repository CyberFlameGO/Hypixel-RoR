require 'logger'
require 'open-uri'
require 'json'

class API

  attr_reader :apiKey

  def init(apiKey)
    @apiKey = apiKey
    @logger = Logger.new STDOUT
  end
end