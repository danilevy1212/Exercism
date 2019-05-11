def to_rna(dna_strand):
    dna2rna = {
        "G" : "C",
        "C" : "G",
        "T" : "A",
        "A" : "U"
    }
    
    return ''.join(dna2rna[c] for c in dna_strand)
