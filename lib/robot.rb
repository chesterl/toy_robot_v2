class Robot

  attr_accessor :placed, :position, :facing

  def initialize
    @placed = false
  end

  def move(args)
    position.send(facing.directions[0])
  end

  def place(args)
    self.placed ? placed : self.placed = true

    if Direction::DIRECTIONS.include?(args[2])
      self.position = TablePosition.new(args[0].to_i, args[1].to_i)
      self.facing = Direction.new(args[2])
    end
  end

  def report(args)
    puts "#{position.x},#{position.y},#{facing.directions[0].upcase}"
  end

  def left(args)
    facing.turn_left
  end

  def right(args)
    facing.turn_right
  end

end