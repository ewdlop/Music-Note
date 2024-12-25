import std.stdio;
import std.socket;
import std.string;
import core.thread;

void handleClient(TcpSocket client) {
    auto request = client.receive(4096);
    writeln("Received request: ", request);

    string response = "HTTP/1.1 200 OK\r\n"
                      ~ "Content-Type: text/plain\r\n"
                      ~ "Content-Length: 9\r\n"
                      ~ "\r\n"
                      ~ "hey honey";

    client.send(response);
    client.close();
}

void startServer(int port) {
    auto listener = new TcpListener(TcpAddress("0.0.0.0", port));
    listener.listen(10);
    writeln("Listening on port ", port, "...");

    while (true) {
        auto client = listener.accept();
        handleClient(client);
    }
}

void main() {
    int[] ports = [8080, 8081, 8082, 8083, 8084, 8085];
    foreach (port; ports) {
        new Thread({
            startServer(port);
        }).start();
    }

    writeln("Servers are running. Press Ctrl+C to exit...");
    while (true) {
        Thread.sleep(dur!("seconds")(1));
    }
}
