from string import ascii_lowercase

def is_pangram(sentence):
    let = {}
    f_sen = filter(lambda c: c.isalpha(), sentence.lower())
    
    for c in f_sen:
        if c not in let:
            let[c] = 1

    return len(let) == len(ascii_lowercase)