package main

import (
    "fmt"
    "net/http"
    "sync"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "hey honey")
}

func startServer(port int, wg *sync.WaitGroup) {
    defer wg.Done()
    mux := http.NewServeMux()
    mux.HandleFunc("/", handler)
    addr := fmt.Sprintf(":%d", port)
    fmt.Printf("Listening on port %d...\n", port)
    if err := http.ListenAndServe(addr, mux); err != nil {
        fmt.Printf("Error starting server on port %d: %v\n", port, err)
    }
}

func main() {
    ports := []int{8080, 8081, 8082, 8083, 8084, 8085}
    var wg sync.WaitGroup

    for _, port := range ports {
        wg.Add(1)
        go startServer(port, &wg)
    }

    fmt.Println("Servers are running. Press Ctrl+C to exit...")
    wg.Wait()
}
