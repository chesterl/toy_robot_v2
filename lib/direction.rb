class Direction

  attr_accessor :directions

  DIRECTIONS = ['north','east','south', 'west']

  def initialize(facing)
    @directions = DIRECTIONS
    orientation(facing)
  end

  def turn_left
    directions.rotate!(-1)
  end

  def turn_right
    directions.rotate!(1)
  end

  def to_s
    "#{directions[0].upcase}"
  end

  private

  def orientation(facing)
    directions.rotate! until directions[0] == facing
  end

end