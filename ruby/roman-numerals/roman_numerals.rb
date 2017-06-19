module BookKeeping
  VERSION = 2
end

module ToRoman
  def self.to_roman(int)
    int.digits.map.with_index do |digit, idx|
      if idx.zero?
        build_roman_digit(digit, 'I', 'V', 'X')
      elsif idx == 1
        build_roman_digit(digit, 'X', 'L', 'C')
      elsif idx == 2
        build_roman_digit(digit, 'C', 'D', 'M')
      elsif idx == 3
        'M' * digit
      end
    end.reverse.join
  end

  def self.build_roman_digit(digit, low_numeral, mid_numeral, high_numeral)
    if digit == 9
      low_numeral + high_numeral
    elsif digit / 5 == 1
      mid_numeral + (low_numeral * (digit - 5))
    elsif digit == 4
      low_numeral + mid_numeral
    elsif digit != 0
      low_numeral * digit
    else
      ''
    end
  end
end

class Integer
  def to_roman
    ToRoman.to_roman(self)
  end
end
