let nmr = readLine()!.split(separator: " ").map{Int($0)!}

let (n,m,r) = (nmr[0],nmr[1],nmr[2])

var graph: [[Int]] = Array(repeating: [], count: n + 1)

for i in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (a,b) = (input[0],input[1])
    
    graph[a].append(b)
    graph[b].append(a)
}

var isVisited = Array(repeating: 0, count: n + 1)

var depth = 1

func dfs(node: Int) {
    isVisited[node] = depth
    
    for next in graph[node].sorted(by: >) {
        if isVisited[next] == 0 {
            depth += 1
            dfs(node: next)
        }
    }
}

dfs(node: r)

print(isVisited[1...].map{String($0)}.joined(separator: "\n"))
