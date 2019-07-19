class CollatzConjecture {
    static steps(n: number): number {
        // Error case
        if (n <= 0) {
            throw new Error('Only positive numbers are allowed')
        }

        return this.collatz(n, 0)
    }

    private static collatz (n: number, step: number): number {
        // Base Case
        if (n === 1) {
            return step
        }

        return this.collatz(n % 2 === 0 ? Math.floor(n / 2) : n * 3 + 1, step + 1 )
    }
}

export default CollatzConjecture
