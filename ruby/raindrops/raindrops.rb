module BookKeeping
  VERSION = 3
end

class Raindrops
  def self.convert(num)
    result = ''
    result += 'Pling' if (num % 3).zero?
    result += 'Plang' if (num % 5).zero?
    result += 'Plong' if (num % 7).zero?

    if result.empty?
      num.to_s
    else
      result
    end
  end
end
