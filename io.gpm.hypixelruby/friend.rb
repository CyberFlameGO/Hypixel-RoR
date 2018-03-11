class Friend

  attr_reader :json, :username, :since

  def slef.from_json(json)
    Friend.new json
  end
end