open System
open System.Net
open System.Text
open System.Threading.Tasks

let responseString = "hey honey"

let startListener (port: int) =
    async {
        let listener = new HttpListener()
        let prefix = sprintf "http://*:%d/" port
        listener.Prefixes.Add(prefix)
        listener.Start()
        printfn "Listening on port %d..." port

        while true do
            let! context = listener.GetContextAsync() |> Async.AwaitTask
            let response = context.Response
            let buffer = Encoding.UTF8.GetBytes(responseString)
            response.ContentLength64 <- int64 buffer.Length
            use output = response.OutputStream
            do! output.WriteAsync(buffer, 0, buffer.Length) |> Async.AwaitTask
            printfn "Responded to request on port %d" port
    }

[<EntryPoint>]
let main argv =
    let ports = [8080; 8081; 8082; 8083; 8084; 8085]
    ports |> List.map startListener |> Async.Parallel |> Async.RunSynchronously |> ignore
    Console.WriteLine("Servers are running. Press Enter to exit...")
    Console.ReadLine() |> ignore
    0
