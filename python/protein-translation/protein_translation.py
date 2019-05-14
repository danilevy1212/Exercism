def proteins(strand):
    condon = {
        "AUG":"Methionine",
        "UUU":"Phenylalanine",
        "UUC":"Phenylalanine",
        "UUA":"Leucine",
        "UUG":"Leucine",
        "UCU":"Serine",
        "UCC":"Serine",
        "UCA":"Serine",
        "UCG":"Serine",
        "UAU":"Tyrosine",
        "UAC":"Tyrosine",
        "UGU":"Cysteine",
        "UGC":"Cysteine",
        "UGG":"Tryptophan"
    }
    stop = { "UAA", "UAG", "UGA" }
    res = []

    for i in range(0, len(strand), 3):
        if strand[i:i+3] not in stop:
            res.append(condon[strand[i:i+3]])
        else:
            break

    return res
