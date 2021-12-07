package main

import "fmt"

/*
 *	var a int
 *	
 *	var (
 *		b bool
 *		c float32
 *		d string
 *	)
 */

 /* Define a stack type using a struct */
type stack struct {
	index int
	data  [5]int
}

/* Define push and pop methods */
func (s *stack) push(k int) {
	s.data[s.index] = k
	s.index++
}

/* Notice the stack pointer s passed as an argument */
func (s *stack) pop() int {
	s.index--
	return s.data[s.index]
}

func main() {
	a := 42;
	b, c := true, 32.7
	d := "string"
	fmt.Println(a, b, c, d)
	fmt.Printf("Hi, i'm a bunch of %d otters in a trenchcoat\n", a)

	/* Define an array of size 4 that stores deployment options */
	var DeploymentOptions = [...]string{"R-pi", "AWS", "GCP", "Azure"}
	/* Loop through the deployment options array */
	for index, option := range DeploymentOptions {
		fmt.Println(index, option)
	}

	/* Define an array containing programming languages */
	languages := [9]string{
		"C", "Lisp", "C++", "Java", "Python",
		"JavaScript", "Ruby", "Go", "Rust", // Must include the trailing comma
	}
	fmt.Println("/----------------------------------/")
	/* Define slices */
	classics := languages[0:3]  // alternatively languages[:3]
	for index, option := range languages {
		fmt.Println(index, option)
	}
	modern := make([]string, 4) // len(modern) = 4
	modern = languages[3:7]     // include 3 exclude 7
	new_ := languages[7:9]       // alternatively languages[7:]

	fmt.Printf("classic languagues: %v\n", classics) // classic languagues: [C Lisp C++]
	fmt.Printf("modern languages: %v\n", modern)     // modern languages: [Java Python JavaScript Ruby]
	fmt.Printf("new_ languages: %v\n", new_)           // new languages: [Go Rust]
	fmt.Println("/----------------------------------/")
	/* Define a map containing the release year of several languages */
	firstReleases := map[string]int{
		"C": 1972, "C++": 1985, "Java": 1996,
		"Python": 1991, "JavaScript": 1996, "Go": 2012,
	}

	/* Loop through each entry and output the name and release year */
	for k, v := range firstReleases {
		fmt.Printf("%s was first released in %d\n", k, v)
	}
	fmt.Println("/----------------------------------/")
	/* Create a pointer to the new stack and push 2 values */
	s := new(stack)
	s.push(23)
	s.push(14)
	fmt.Printf("stack: %v\n", *s) // stack: {2 [23 14 0 0 0]}
	
}