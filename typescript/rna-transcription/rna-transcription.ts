export default class Transcriptor {
  private static readonly complements: { [key: string]: string; } = { G: 'C', C: 'G', T: 'A', A: 'U' };
  private static readonly validNucleotides: string[] = Object.keys(Transcriptor.complements);
  toRna(strand: string): string {
    if (strand.split('').some((nucleotide: string) => !Transcriptor.validNucleotides.includes(nucleotide) )) {
      throw 'Invalid input DNA.';
    }
    return strand.split('').map((nucleotide: string) => {
      return Transcriptor.complements[nucleotide];
    }).join('');
  };
}
