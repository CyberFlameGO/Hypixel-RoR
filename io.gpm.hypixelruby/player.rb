class Player

  attr_reader :json, :username, :uuid, :statHandler

  def self.from_json(json)
    Player.new json['player']
  end

  def initialize(json)
    @json = json
    @username = json['username']
    @uuid = json['uuid']
    @statHandler = Hash.new

  end
end