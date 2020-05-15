// Package twofer provides the ability to share with others.
package twofer

import "fmt"

// ShareWith returns the string "One for you, one for me." substituting the
// given name for 'you' if not empty.
func ShareWith(name string) string {
	if (name == "") {
		return "One for you, one for me."
	}

	return fmt.Sprintf("One for %v, one for me.", name)
}
