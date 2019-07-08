class Transcriptor {
    static readonly RNA2DNA = new Map<string,string>()
        .set('C','G')
        .set('G','C')
        .set('A','U')
        .set('T','A');

    toRna(dna: string): string {
        let res = [];
        for(const c of dna){
            if(Transcriptor.RNA2DNA.has(c)) {
                res.push(Transcriptor.RNA2DNA.get(c))
            } else {
                throw 'Invalid input DNA.';
            }
        }
        return res.join('');
    }
}

export default Transcriptor
