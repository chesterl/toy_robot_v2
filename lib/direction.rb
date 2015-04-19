class Direction

  attr_accessor :directions

  DIRECTIONS = ['north','east','south', 'west']

  def initialize(facing)
    @directions = ['north','east','south', 'west']
    until @directions[0] == facing
      @directions.rotate!
    end
  end

  def turn_left
    @directions.rotate!(-1)
  end

  def turn_right
    @directions.rotate!(1)
  end

end