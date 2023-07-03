// Print Hello, Go, as  called by a CGI script.

package main

import (
	"fmt"
)

func main() {
	fmt.Println("Content-type: text/html\n")
	fmt.Println("<p class=\"go\">Hello, Go!</p>")
}
