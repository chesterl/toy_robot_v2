class Direction

  attr_accessor :directions

  DIRECTIONS = ['north','east','south', 'west']

  def initialize(facing)
    @directions = ['north','east','south', 'west']
    until @directions[0] == facing
      @directions.rotate!
    end
  end



end