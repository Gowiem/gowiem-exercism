"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function isYelling(input) {
    const codes = input.split('').map((_, idx) => input.charCodeAt(idx));
    const noLower = !codes.some((code) => (code >= 97 && code <= 122) || (code >= 221 && code <= 252));
    const hasUpper = codes.some((code) => code >= 65 && code <= 90);
    return noLower && hasUpper;
}
class Bob {
    hey(input) {
        const trimmedInput = input.trim();
        if (isYelling(trimmedInput)) {
            return 'Whoa, chill out!';
        }
        else if (trimmedInput.split('')[trimmedInput.length - 1] === '?') {
            return 'Sure.';
        }
        else if (trimmedInput === '') {
            return 'Fine. Be that way!';
        }
        else {
            return 'Whatever.';
        }
    }
}
exports.default = Bob;
//# sourceMappingURL=bob.js.map