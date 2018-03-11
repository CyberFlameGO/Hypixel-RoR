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

  def guildById(id)
    @logger.info "Looking for guild from ID [#{id}]"
    request = handleRequest('guild', {
        :id => id
    })

    Guild.from_json request
  end

  def guildByUsername(username)
    @logger.info "Looking for guild from username [#{username}]"
    request = handleRequest('guild', {
        :username => username
    })

    Guild.from_json request
  end

  def guildByName(name)
    @logger.info "Looking for guild from name [#{name}]"
    request = handleRequest('guild', {
        :name => name
    })

    Guild.from_json request
  end

  def playerByUsername(username)
    @logger.info "Looking up player by username [#{username}]"
    request = make_request('player', {
        :name => username
    })
    Player.from_json request
  end

  def playerByUniqueID(uuid)
    @logger.info "Looking up player by UUID [#{uuid}]"
    request = make_request('player', {
        :uuid => uuid
    })
    Player.from_json request
  end

  def handleRequest(type, params)
    params[:key] = apiKey
    uri = URI.parse "https://api.hypixel.net/#{type}"
    uri.query = URI.encode_www_form params

    JSON.parse uri.open.readline

  end
end