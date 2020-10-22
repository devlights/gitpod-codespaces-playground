package main

import (
	"fmt"
	"io"
)

type (
	impl struct{}
)

func (impl) Close() error {
	fmt.Println("[impl.Close] called")
	return nil
}

func (impl) Read(p []byte) (n int, err error) {
	fmt.Println("[impl.Read] called")
	return 0, nil
}

func (impl) Write(p []byte) (n int, err error) {
	fmt.Println("[impl.Write] called")
	return 0, nil
}

func main() {
	var i impl

	i.Read(nil)
	i.Write(nil)
	i.Close()

	var r io.Reader = i
	r.Read(nil)

	var w io.Writer = i
	w.Write(nil)

	var c io.Closer = i
	c.Close()

	var rwc io.ReadWriteCloser = i
	rwc.Read(nil)
	rwc.Write(nil)
	rwc.Close()
}
