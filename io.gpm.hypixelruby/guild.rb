class Guild

  attr_reader :json, :id, :name, :tag, :motd, :members, :created

  def self.from_json(json)
    Guild.new json['guild']
  end
end

class GuildMember

  attr_reader :json, :username, :rank, :joined

  def self.from_json(json)
    GuildMember.new json
  end
end