module BookKeeping
  VERSION = 4
end

class Complement
  DNA_TO_RNA = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }
  def self.of_dna(strand)
    return '' unless strand.each_char.all? { |nuc| DNA_TO_RNA.key? nuc }
    strand.each_char.map { |nuc| DNA_TO_RNA[nuc] }.join
  end
end
