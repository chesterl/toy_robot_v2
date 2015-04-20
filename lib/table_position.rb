class TablePosition < Table

  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def north
    @y += 1
    @y -= 1 unless Table.new.valid_position?(@x,@y)
  end

  def east
    @x += 1
    @x -= 1 unless Table.new.valid_position?(@x,@y)
  end

  def south
    @y -= 1
    @y += 1 unless Table.new.valid_position?(@x,@y)
  end

  def west
    @x -= 1
    @x += 1 unless Table.new.valid_position?(@x,@y)
  end
end