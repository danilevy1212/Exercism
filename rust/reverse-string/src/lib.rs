#[cfg(feature = "grapheme")]
extern crate unicode_reverse;

#[cfg(feature = "grapheme")]
pub fn reverse(input: &str) -> String {
    let mut res = String::from(input);

    unicode_reverse::reverse_grapheme_clusters_in_place(&mut res);

    res
}

#[cfg(not(feature = "grapheme"))]
pub fn reverse(input: &str) -> String {
    input.chars().rev().collect()
}
