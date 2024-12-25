pragma.syntax("0.9")

def makeServer(port) :any {
    def server := makeListener("0.0.0.0", port)

    def handler := def makeHandler() :any {
        to handleRequest(req :any) :any {
            println("Received request: " + req)
            return "hey honey"
        }
    }

    server.listen(handler)
    println("Server is listening on port " + port)
}

def main() {
    def ports := [8080, 8081, 8082, 8083, 8084, 8085]

    for port in ports {
        makeServer(port)
    }

    println("Servers are running. Press Ctrl+C to exit.")
}

main()
