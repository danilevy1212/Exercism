const collatz = (n, step) => {
    // Base Case
    if(n === 1)
        return step;

    return collatz(n % 2 == 0 ? Math.floor(n / 2) : n * 3 + 1, step + 1 );
};

export const steps = (n) => {
    // Error case
    if(n <= 0)
        throw new Error('Only positive numbers are allowed');

    return collatz(n, 0);
}
