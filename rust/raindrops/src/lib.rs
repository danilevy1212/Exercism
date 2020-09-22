pub fn raindrops(n: u32) -> String {
    let rain_sounds = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
        .iter()
        .filter(|pair| n % pair.0 == 0)
        .map(|pair| pair.1)
        .collect::<String>();

    match rain_sounds.is_empty() {
        true => n.to_string(),
        false => rain_sounds,
    }
}
