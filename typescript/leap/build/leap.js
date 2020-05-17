"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
function isLeapYear(year) {
    if (year % 400 === 0) {
        return true;
    }
    else if (year % 100 === 0) {
        return false;
    }
    else if (year % 4 === 0) {
        return true;
    }
    else {
        return false;
    }
}
exports.default = isLeapYear;
;
//# sourceMappingURL=leap.js.map