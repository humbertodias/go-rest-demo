package main

import (
	"fmt"
	"github.com/humbertodias/go-rest-demo/handler"
	"net/http"
	"os"
)

func main() {
	PORT := "8080"
	if p := os.Getenv("PORT"); p != "" {
		PORT = p
	}
	go handler.Init()
	http.HandleFunc("/", handler.ShowApi)

	fmt.Printf("Listening at http://0.0.0.0:%s\n", PORT)
	addr := fmt.Sprintf(":%s", PORT)
	http.ListenAndServe(addr, nil)
}
