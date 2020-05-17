export default class Pangram {
  private readonly allLowers: string[] = (() => {
    const result = Array();
    for (let i = 97; i <= 122; i++) {
      result.push(String.fromCharCode(i));
    }
    return result;
  })();

  constructor(private readonly input: string) {
    this.input = input.toLowerCase();
  }

  isPangram(): boolean {
    return this.allLowers.every((char) => this.input.includes(char));
  }
}
