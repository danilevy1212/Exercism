pub fn factors(mut n: u64) -> Vec<u64> {
    let mut res = Vec::new();
    let mut factor: u64 = 2;

    while n > 1 {
        if n % factor == 0 {
            res.push(factor);
            n /= factor;
        } else {
            factor += 1;
        }
    }

    res
}
