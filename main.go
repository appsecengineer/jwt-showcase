package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	// we will implement these handlers in the next sections
	http.HandleFunc("/signin", Signin)
	http.HandleFunc("/welcome", Welcome)
	http.HandleFunc("/refresh", Refresh)
	http.HandleFunc("/logout", Logout)

	// start the server on port 8000
	fmt.Println("Listening on port 8000...")
	log.Fatal(http.ListenAndServe(":8000", nil))
}
