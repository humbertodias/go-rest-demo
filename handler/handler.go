package handler

import (
	"fmt"
	"net/http"
)

func Init() {
}

func ShowApi(w http.ResponseWriter, r *http.Request) {
	endpoints := `
	<a href="/provincias">/provincias</a> <br>
	`
	fmt.Fprintln(w, endpoints)
}
