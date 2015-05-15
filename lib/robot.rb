class Robot

  attr_accessor :position, :facing, :placed

  def initialize
    @placed = false
  end

  def move(args = {})
    return if args[:placement]
    position.send(facing.directions[0], args[:table])
  end

  def place(args = {})
      self.placed = true
      self.position = TablePosition.new(args[:placement][0].to_i, args[:placement][1].to_i)
      self.facing = Direction.new(args[:direction])
  end

  def report(args = {})
    return if args[:placement]
    puts "#{position},#{facing}"
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