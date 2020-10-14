use std::collections::HashSet;
use std::iter::FromIterator;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    let (lower_word, sorted_word) = get_lower_sorted_pair(word);

    HashSet::from_iter(
        possible_anagrams
            .iter()
            .filter(|cand| {
                let (lower_cand, sorted_cand) = get_lower_sorted_pair(cand);

                lower_cand != lower_word && sorted_cand == sorted_word
            })
            .map(|x| *x)
    )
}

fn get_lower_sorted_pair(word: &str) -> (String, String) {
    let lower_word = word.to_lowercase();
    let mut sorted_word = lower_word.chars().collect::<Vec<char>>();
    sorted_word.sort();
    let sorted_word = sorted_word.iter().collect::<String>();

    (lower_word, sorted_word)
}
