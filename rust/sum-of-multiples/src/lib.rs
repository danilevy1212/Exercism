pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (0..limit)
        .filter(|x| {
            factors.iter().any(|f| match f {
                0 => false,
                _ => x % f == 0,
            })
        })
        .sum()
}
