// Package hamming provides the ability to calculate Hamming Distance
package hamming

import "errors"

// Distance calculates the Hamming Distance between two given DNA strands.
func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return 0, errors.New("given DNA strangs were not of equal length")
	}

	var result int = 0
	aChars := []rune(a)
	bChars := []rune(b)
	for index, char := range aChars {
		if char != bChars[index] {
			result++
		}
	}

	return result, nil
}
