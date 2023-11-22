package main

import (
	"fmt"
	"net/http"
	"text/template"

	"github.com/xyproto/randomstring"
)

func init() {
	fmt.Println("Starting Server...")
}

func main() {
	var port string = "8080"
	fmt.Printf("Serving at %s/tcp...", port)

	http.HandleFunc("/", index)

	err := http.ListenAndServe(fmt.Sprintf(":%s", port), nil)
	if err != nil {
		fmt.Println(err)
	}
}

func index(w http.ResponseWriter, r *http.Request) {
	t, err := template.New("index").Parse(`
	<h1>The Saved String Is {{ . }}!</h1>
	`)
	if err != nil {
		fmt.Println(err)
	}

	err = t.Execute(w, randomstring.HumanFriendlyString(10))
	if err != nil {
		fmt.Println(err)
	}
}
