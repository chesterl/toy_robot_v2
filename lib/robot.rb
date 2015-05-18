class Robot

  attr_accessor :position, :direction, :placed

  def initialize
    @placed = false
  end

  def move(table)
    position.send(direction.directions[0], table)
  end

  def place(coordinates,facing)
      self.placed = true
      self.position = coordinates
      self.direction = facing
  end

  def report
    puts "#{position},#{direction}"
  end

  def left
    direction.turn_left
  end

  def right
    direction.turn_right
  end

end