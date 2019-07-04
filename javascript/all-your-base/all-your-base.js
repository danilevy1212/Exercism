const pipe = (arr, ...fns) => fns.reduce((v, fn) => fn(v), arr);

const verify = (from, to) => (arr) => {
    const innerError = arr.some((n) => n < 0 || n >= from);

    if(!from || from <= 1 || !Number.isInteger(from))
        throw Error('Wrong input base');
    if(!to || to <= 1 || !Number.isInteger(to))
        throw Error('Wrong output base');
    if(!arr || !arr.length || (arr[0] === 0 && arr.length > 1) || innerError)
        throw Error('Input has wrong format');

    return arr;
};

const fromBto10 = (from) => (arr) => arr.reduceRight((sum, digit, i) =>
                                                     sum + digit * Math.pow(from, arr.length - i - 1),
                                                     0);

const from10toB = (to) => (nb10, res = []) => (nb10 <= 0) ? res : from10toB(to)(Math.floor(nb10 / to),
                    res.concat([nb10 % to]));

const end = (num) => num.length ? num.reverse() : [0];

export const convert = (numArr, from, to) => pipe(numArr,
                                                  verify(from, to),
                                                  fromBto10(from),
                                                  from10toB(to),
                                                  end);
