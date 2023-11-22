.PHONY: run clean

run: $(find -depth 1 -name '*.go' -print) go.mod
	go run .

bin/app: $(find -depth 1 -name '*.go' -print) go.mod
	go build -o bin/app .

clean:
	rm -fvr bin
