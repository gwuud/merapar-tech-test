.PHONY: clean

bin/server: main.go go.mod
	GOOS=darwin /usr/local/bin/go build -o bin/server .

bin/server-dist: main.go go.mod
	GOOS=linux /usr/local/go/bin/go build -o bin/server-dist .

clean:
	rm -fvr bin
