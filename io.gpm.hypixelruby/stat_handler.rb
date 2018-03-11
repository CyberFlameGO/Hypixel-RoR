class StatHandler

  attr_reader :package, :coins

  def initialize(json, name)
    json = json['stats'][name]
    @packages = json['packages'] ||= []
    @coins = json['coins'] ||= 0
  end
end