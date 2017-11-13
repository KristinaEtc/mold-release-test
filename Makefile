all: run
	echo ">MAKEFILE"
	
run: 
	go build main.go

.PHONY: dep

dep:
	go get -u github.com/golang/dep/cmd/dep
	dep ensure