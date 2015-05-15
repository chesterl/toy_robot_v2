class TablePosition

  attr_accessor :x, :y

  def initialize(x,y)
    @x = x
    @y = y
  end

  def north(table)
    self.y += 1
    self.y -= 1 unless table.valid_position?(x,y)
  end

  def east(table)
    self.x += 1
    self.x -= 1 unless table.valid_position?(x,y)
  end

  def south(table)
    self.y -= 1
    self.y += 1 unless table.valid_position?(x,y)
  end

  def west(table)
    self.x -= 1
    self.x += 1 unless table.valid_position?(x,y)
  end
end