export default class MatchingBrackets {
    private b_st: string[] = [];
    private input: string;

    private static readonly OPEN2CLOSE: Map<string,string> = new Map<string,string>()
        .set('{','}').set('(',')').set('[',']');
    private static readonly CLOSE2OPEN: Map<string,string> = new Map<string,string>()
        .set('}','{').set(')','(').set(']',']');

    constructor(input: string) {
        this.input = input;
    }

    isPaired(): boolean {
        let res: boolean = true;
        for(const c of this.input){
            switch (res) {
                case MatchingBrackets.OPEN2CLOSE.has(c):
                    this.b_st.push(c);
                    break;
                case MatchingBrackets.CLOSE2OPEN.has(c):
                    const last:string|undefined = this.b_st.pop();
                    res = !!last && c === MatchingBrackets.OPEN2CLOSE.get(last);
                    break;
            }
        }
        return !!(this.b_st.length === 0) && res;
    }
}
