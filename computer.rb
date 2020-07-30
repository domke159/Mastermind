class Computer
  attr_accessor :colours

  def initialize()
    @colours = ["R", "B", "G", "Y", "P", "O"]
  end  

  def create_code
    @colours.sample(4)
  end
end