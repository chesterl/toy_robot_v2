class Robot

  attr_accessor :placed, :position, :facing

  def initialize
    @placed = false
  end

  def move(*args)
    puts "I'm moving"
    # position.move
  end

  def place(args)
    self.placed ? placed : self.placed = true

    if Direction::DIRECTIONS.include?(args[2])
      self.position = TablePosition.new(args[0], args[1])
      self.facing = Direction.new(args[2])
    end
  end

  def report(args)
    puts "#{position.x},#{position.y},#{facing.directions[0].upcase}"
  end

end