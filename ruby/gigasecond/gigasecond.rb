module BookKeeping
  VERSION = 5
end

class Gigasecond
  GIGA = 1_000_000_000
  def self.from(time)
    Time.at(time.to_i + GIGA)
  end
end
