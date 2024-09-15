let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let (n,m) = (nm[0], nm[1])

var graph = Array(repeating: [Int](), count: n + 1)
var isVisited = Array(repeating: false, count: n + 1)

var result = 0

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map{ Int($0)! }
    let (u,v) = (uv[0], uv[1])
    graph[u].append(v)
    graph[v].append(u)
}

func dfs(_ node: Int) {
    isVisited[node] = true
    
    for vertex in graph[node] {
        if !isVisited[vertex] {
            dfs(vertex)
        }
    }
}

for i in 1...n {
    if !isVisited[i] {
        result += 1
        dfs(i)
    }
}

print(result)
 
