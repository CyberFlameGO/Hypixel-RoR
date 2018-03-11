class Player

  attr_reader :json, :username, :uuid, :StatHandler

  def self.from_json(json)
    Player.new json['player']
  end

  def initialize(json)
    @json = json
    @username = json['username']
    @uuid = json['uuid']
    @StatHandler = Hash.new

    @StatHandler[:Arcade] = StatHandler::Generic.new json
    @StatHandler[:Bedwars] = StatHandler::Generic.new json
    @StatHandler[:SkyWars] = StatHandler::Generic.new json
    @StatHandler[:Murder_Mystery] = StatHandler::Generic.new json
    @StatHandler[:UHC] = StatHandler::Generic.new json
    @StatHandler[:Class_Games] = StatHandler::Generic.new json
    @StatHandler[:Build_Battle] = StatHandler::Generic.new json
    @StatHandler[:Cops_And_Crims] = StatHandler::Generic.new json
    @StatHandler[:Crazy_Walls] = StatHandler::Generic.new json
    @StatHandler[:Duels] = StatHandler::Generic.new json
    @StatHandler[:Mega_Walls] = StatHandler::Generic.new json
    @StatHandler[:QuakeCraft] = StatHandler::Generic.new json
    @StatHandler[:Blitz] = StatHandler::Generic.new json
    @StatHandler[:SkyClash] = StatHandler::Generic.new json
    @StatHandler[:Smash_Heroes] = StatHandler::Generic.new json
    @StatHandler[:Speed_UHC] = StatHandler::Generic.new json
    @StatHandler[:TNT] = StatHandler::Generic.new json
    @StatHandler[:TKR] = StatHandler::Generic.new json
    @StatHandler[:The_Walls] = StatHandler::Generic.new json
    @StatHandler[:Warlords] = StatHandler::Generic.new json

  end
end