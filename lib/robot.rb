class Robot

  attr_accessor :position, :direction, :placed

  def initialize
    @placed = false
  end

  def move(args = {})
    return if args[:placement]
    position.send(direction.directions[0], args[:table])
  end

  def place(coordinates,facing)
      self.placed = true
      self.position = coordinates
      self.direction = facing
  end

  def report(args = {})
    return if args[:placement]
    puts "#{position},#{direction}"
  end

  def left(args = {})
    return if args[:placement]
    direction.turn_left
  end

  def right(args = {})
    return if args[:placement]
    direction.turn_right
  end

end