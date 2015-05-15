class TablePosition

  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def north(table)
    self.y += 1 if table.valid_position?(x,y+1)
  end

  def east(table)
    self.x += 1 if table.valid_position?(x+1,y)
  end

  def south(table)
    self.y -= 1 if table.valid_position?(x,y-1)
  end

  def west(table)
    self.x -= 1 if table.valid_position?(x-1,y)
  end

  def to_s
    "#{x},#{y}"
  end
end