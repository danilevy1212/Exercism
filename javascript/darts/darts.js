'use strict';

const pow2 = (x) => Math.pow(x, 2);
const calcRad = (x, y) => Math.sqrt(pow2(x)+pow2(y));

export const solve = (x, y) => {
    const r = calcRad(x, y);

    switch (true) {
        case r <= 1:
            return 10;
        case r <= 5:
            return 5;
        case r <= 10:
            return 1;
        default:
            return 0;
        }
};
