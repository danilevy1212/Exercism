export const matchingBrackets = (input) => {
    const brackets = {'{':'}','(':')','[':']'};
    let openStack = [],
        res = true;

    [...input].forEach((elt) => {
        if(brackets[elt]){
            openStack.push(elt);
        }
        if(Object.values(brackets).includes(elt)){
            // If the stack is empty and there is a close bracket, it will never match
            res = res && !!openStack.length;
            if(res){
                const poped = openStack.pop();
                res = res && (elt == brackets[poped]);
            }
        }
    });

    return !openStack.length && res;
};
