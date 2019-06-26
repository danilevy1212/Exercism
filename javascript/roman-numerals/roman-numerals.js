const rom2decHelper = (dec, res) => {
    const sym2num = { "M": 1000, "CM": 900, "D": 500, "CD": 400, "C": 100,
                      "XC": 90,  "L": 50,   "XL": 40, "X": 10,   "IX": 9,
                      "V": 5,    "IV": 4,   "I": 1 },
          rom = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];

    let ldec = dec,
        tres = res;

    for(const sym of rom){
        if (dec - sym2num[sym] >= 0) {
            tres = tres.concat(sym);
            ldec -= sym2num[sym];
            break;
        }
    }

    return rom2dec(ldec, tres);
};

const rom2dec = (dec, res) => dec <= 0 ? res : rom2decHelper(dec, res);

export const toRoman = (dec) => rom2dec(dec, "");
