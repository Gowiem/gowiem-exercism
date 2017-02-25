module BookKeeping
  VERSION = 1
end

class Sieve
  def initialize(range_end)
    @range_end = range_end
  end

  def primes
    state = (2..@range_end).to_a
    result = state.dup
    (@range_end - 1).times do |i|
      p = 2 * state[i]
      while p <= @range_end
        result.delete(p)
        p += state[i]
      end
    end
    result
  end
end
