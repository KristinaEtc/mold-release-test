package main

import (
	"fmt"
	"time"

	res "github.com/d3sw/go-owf/resolver"
)

func main() {

	addrResolver := res.NewResolver(8600, []string{"consul.service.owf-dev"}...)
	fmt.Printf("addrResolver :%+v\n", addrResolver)

	time.Sleep(time.Second * 8)
	fmt.Printf("addrResolver :%+v\n", "addrResolver")
}
