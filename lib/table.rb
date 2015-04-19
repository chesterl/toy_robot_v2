class Table

  def initialize(width = 5,height = 5)
    @width = 0..width
    @height = 0..height
  end

  def valid_position?(x,y)
    # binding.pry
    (@width).include?(x) and (@height).include?(y)
  end

end