class Robot

  attr_accessor :position, :facing

  def move(args)
    return if args
    position.send(facing.directions[0])
  end

  def place(args)
    if Direction::DIRECTIONS.include?(args[2])
      self.position = TablePosition.new(args[0].to_i, args[1].to_i)
      self.facing = Direction.new(args[2])
    end
  end

  def report(args)
    return if args
    puts "#{position.x},#{position.y},#{facing.directions[0].upcase}"
  end

  def left(args)
    return if args
    facing.turn_left
  end

  def right(args)
    return if args
    facing.turn_right
  end

end