package main

import (
	"fmt"
	"strconv"
	"testing"
)

func TestFormatInt(t *testing.T) {
	tests := []struct {
		name string
		in   int64
		base int
		out  string
	}{
		{"999", 999, 10, "999"},
		{"9", 9, 8, "11"},
		{"15", 15, 16, "f"},
		{"32", 32, 16, "20"},
		{"255", 255, 2, "11111111"},
	}

	for _, test := range tests {
		test := test
		t.Run(test.name, func(t *testing.T) {
			s := strconv.FormatInt(test.in, test.base)
			if s != test.out {
				t.Errorf("[want] %v\t[got] %v", test.out, s)
			}
		})
	}
}

func BenchmarkX(b *testing.B) {
	var (
		s []string
	)

	for i := 0; i < b.N; i++ {
		s = append(s, fmt.Sprint(i))
	}
}

func BenchmarkY(b *testing.B) {
	var (
		s []string
	)

	for i := 0; i < b.N; i++ {
		s = append(s, strconv.Itoa(i))
	}
}

func BenchmarkZ(b *testing.B) {
	var (
		s = make([]string, b.N)
	)

	for i := 0; i < b.N; i++ {
		s[i] = strconv.Itoa(i)
	}
}

func BenchmarkA(b *testing.B) {
	var (
		s = make([]string, 0, b.N)
	)

	for i := 0; i < b.N; i++ {
		s = append(s, strconv.Itoa(i))
	}
}
