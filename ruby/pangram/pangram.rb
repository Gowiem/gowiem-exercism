module BookKeeping
  VERSION = 4
end

class Pangram
  def self.pangram?(input)
    no_case = input.downcase
    ('a'..'z').all? { |char| no_case.include?(char) }
  end
end
