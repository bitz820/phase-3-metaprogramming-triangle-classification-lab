require "pry"

class Triangle

  def initialize l1, l2, l3
    @l1 = l1
    @l2 = l2
    @l3 = l3
    @sides = [@l1, @l2, @l3]
  end

  def kind 
    is_triangle
    @sides = [@l1, @l2, @l3]
      if @sides.uniq.count == 1
        :equilateral
      elsif @sides.uniq.count == 2
        :isosceles
      elsif @sides.uniq.count == 3
        :scalene
      end

  end

  def is_triangle 
    raise TriangleError unless all_positive && length_compare
  end

  def all_positive
    @sides.all? {|side| side >= 0}
  end

  def length_compare
    # sorted = @sides.sort
    # longest = @sides.pop
    # (@sides[0] + @sides[1]) > longest
    @l1 + @l2 > @l3 && @l1 + @l3 > @l2 && @l3 + @l2 > @l1
  end


  class TriangleError < StandardError
    def message
      "Not a valid triangle"
    end
  end

end
