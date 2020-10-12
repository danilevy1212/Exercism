use regex::Regex;

pub fn translate(input: &str) -> String {
    let words = input.split(' ').collect::<Vec<&str>>();

    words.iter().map(to_pig_latin).collect::<Vec<String>>().join(" ")
}

fn to_pig_latin(input: &&str) -> String {
    let vocal_start = Regex::new(r"(^[aeiou]+)|(^yt)|(^xr)").unwrap();

    if vocal_start.is_match(input) {
        return String::from(*input) + "ay";
    }

    let consonant_start = Regex::new(r"(^[^aeiouq]*qu)|(^[^aeiou][^aeiouy]*)").unwrap();

    consonant_start
        .find_iter(input)
        .map(|m| m.as_str())
        .collect::<Vec<&str>>()
        .into_iter()
        .chain(consonant_start.split(input).collect::<Vec<&str>>())
        .rev()
        .collect::<String>() + "ay"
}
