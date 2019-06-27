"use strict";

const abilityRange = (x, LOWER = 3, UPPER = 18) =>{
        if((x < LOWER))
            throw new Error(`Ability scores must be at least ${LOWER}`);
        if(x > UPPER)
            throw new Error(`Ability scores can be at most ${UPPER}`);
        return x;
      };

export const abilityModifier = (x, MINUS = 10, DIVIDE = 2) => Math.floor((abilityRange(x) - MINUS) / DIVIDE);

export class Character {
    constructor() {
        const stats = ["strength", "dexterity", "constitution", "intelligence", "wisdom", "charisma"];

        stats.forEach((stat) => this[stat] = Character.rollAbility());
        this.hitpoints = abilityModifier(this.constitution) + 10;
    }

    static rollAbility(N = 4) {
        const rolls = Array.from({length: N}, () => Character.rollDice());

        return rolls.filter((x) => x !== Math.min(...rolls))
            .reduce((sum, x) => sum+=x);
    }

    static rollDice() {
        return Math.floor(Math.random() * (7 - 1)) + 1;
    }
}
