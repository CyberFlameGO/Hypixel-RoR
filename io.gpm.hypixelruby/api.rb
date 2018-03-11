require 'logger'
require 'open-uri'
require 'json'

class API

  attr_reader :apiKey

  def init(apiKey)
    @apiKey = apiKey
    @logger = Logger.new STDOUT
  end

  def friendByName(username)
    @logger.info "Looking for user with the name: [#{username}]"

    request = handleRequest('friends', {
        :player => username
    })

    friends = Array.new

    if request.has_key? 'records'
      request['records'].each do | record | friends << Friend.from_json(record)
      end
    end
    friends
  end

  def handleRequest(type, params)
    params[:key] = apiKey
    uri = URI.parse "https://api.hypixel.net/#{type}"
    uri.query = URI.encode_www_form params

    JSON.parse uri.open.readline

  end
end