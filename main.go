package main

import "fmt"

func main() {
	var (
		s = "hello world"
	)

	// https://devlights.hatenablog.com/entry/2020/08/18/014703
	fmt.Printf("%[1]T:%[1]v\n", s[0:1])
	fmt.Printf("%[1]T:%[1]v\n", s[0])
	fmt.Printf("%[1]T:%[1]v:%[2]v\n", s[0], string(s[0]))
}
