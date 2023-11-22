.PHONY: clean

bin/server: main.go go.mod
	GOOS=darwin /usr/local/bin/go build -o bin/app .

bin/server-dist: main.go go.mod
	GOOS=linux /usr/local/go build -o bin/app .

clean:
	rm -fvr bin
