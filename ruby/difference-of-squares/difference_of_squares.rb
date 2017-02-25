module BookKeeping
  VERSION = 3
end

class Squares
  def initialize(num)
    @num = num
  end

  def square_of_sum
    (1..@num).reduce(&:+) ** 2
  end

  def sum_of_squares
    ((1..@num).map { |n| n ** 2 }).reduce(&:+)
  end

  def difference
    return 0 if @num.zero?
    square_of_sum - sum_of_squares
  end
end
