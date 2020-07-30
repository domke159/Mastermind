class Player
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  def to_s
    "Player name: #{@name}"
  end
end
  