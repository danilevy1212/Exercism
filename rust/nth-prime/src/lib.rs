pub fn nth(n: u32) -> u32 {
    match (2..).filter(is_prime).nth(n as usize) {
        Some(res) => res,
        None => panic!("This cannot be happenning!"),
    }
}

fn is_prime(n: &u32) -> bool {
    let target = ((n + 1) as f32).sqrt().ceil() as u32;

    !(2..target).any(|i| n % i == 0)
}
