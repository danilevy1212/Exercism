export const validate = (n) => {
    return [...`${n}`]
        .reduce((sum, elt) => sum + Math.pow(elt, `${n}`.length), 0) === n;
};
