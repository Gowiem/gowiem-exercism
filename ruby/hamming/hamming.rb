class Hamming
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.size != strand2.size
    pairs = (strand1.chars).zip(strand2.chars)
    pairs.count { |pair| pair[0] != pair[1] }
  end
end

module BookKeeping
  VERSION = 3
end
