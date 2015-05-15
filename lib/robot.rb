class Robot

  attr_accessor :position, :facing

  def move(args = {})
    return if args[:placement]
    position.send(facing.directions[0], args[:table])
  end

  def place(args = {})
    if Direction::DIRECTIONS.include?(args[:direction])
      self.position = TablePosition.new(args[:placement][0].to_i, args[:placement][1].to_i)
      self.facing = Direction.new(args[:direction])
    end
  end

  def report(args = {})
    return if args[:placement]
    puts "#{position.x},#{position.y},#{facing.directions[0].upcase}"
  end

  def left(args = {})
    return if args[:placement]
    facing.turn_left
  end

  def right(args = {})
    return if args[:placement]
    facing.turn_right
  end

end