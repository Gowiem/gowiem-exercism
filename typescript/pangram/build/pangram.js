"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
class Pangram {
    constructor(input) {
        this.input = input;
        this.allLowers = (() => {
            const result = Array();
            for (let i = 97; i <= 122; i++) {
                result.push(String.fromCharCode(i));
            }
            return result;
        })();
        this.input = input.toLowerCase();
    }
    isPangram() {
        return this.allLowers.every((char) => this.input.includes(char));
    }
}
exports.default = Pangram;
//# sourceMappingURL=pangram.js.map