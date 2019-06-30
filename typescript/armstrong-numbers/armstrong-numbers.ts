export default class ArmstrongNumbers {
    static isArmstrongNumber(n: number): boolean {
        const nArr: number[] = ((n: number) => [...`${n}`].map(Number))(n)

        return nArr.reduce((sum, elt) => sum + Math.pow(elt, nArr.length), 0) === n
    }
}
