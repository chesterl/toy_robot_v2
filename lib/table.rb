class Table

  def initialize(width,height)
    @width = 0..width
    @height = 0..height
  end

  def valid_position?(x,y)
    @width.include?(x) and @height.include?(y)
  end

end