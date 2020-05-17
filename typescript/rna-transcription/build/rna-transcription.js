"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class Transcriptor {
    toRna(strand) {
        if (strand.split('').some((nucleotide) => !Transcriptor.validNucleotides.includes(nucleotide))) {
            throw 'Invalid input DNA.';
        }
        return strand.split('').map((nucleotide) => {
            return Transcriptor.complements[nucleotide];
        }).join('');
    }
    ;
}
Transcriptor.complements = { G: 'C', C: 'G', T: 'A', A: 'U' };
Transcriptor.validNucleotides = Object.keys(Transcriptor.complements);
exports.default = Transcriptor;
//# sourceMappingURL=rna-transcription.js.map