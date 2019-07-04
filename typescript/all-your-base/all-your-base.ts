export default class Converter {
    private pipe = (arr: number[], ...fns: Function[]) => fns.reduce((v, fn) => fn(v), arr)

    private verify = (from: number, to: number) => (arr: number[]) => {
        const innerError = arr.some((n) => n < 0 || n >= from)

        if (!from || from <= 1 || from !== Math.floor(from)) {
            throw Error('Wrong input base')
        }
        if (!to || to <= 1 || to !== Math.floor(to)) {
            throw Error('Wrong output base')
        }
        if (!arr || !arr.length || (arr[0] === 0 && arr.length > 1) || innerError) {
            throw Error('Input has wrong format')
        }

        return arr
    }

    private fromBto10 = (from: number) => (arr: number[]) =>
        arr.reduceRight((sum, digit, i) => sum + digit * Math.pow(from, arr.length - i - 1),
                        0)

    private from10toB = (to: number) => (nb10: number, res: number[] = []): number[] =>
        (nb10 <= 0) ? res : this.from10toB(to)(Math.floor(nb10 / to),
                                               res.concat([nb10 % to]))

    private end = (num: number[]) => num.length ? num.reverse() : [0]

    convert(numArr: number[], from: number, to: number) {
        return this.pipe(numArr,
                    this.verify(from, to),
                    this.fromBto10(from),
                    this.from10toB(to),
                    this.end)
    }
}
