let n = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: n + 1)

for _ in 0..<n - 1 {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let (a, b) = (input[0], input[1])
    graph[a].append(b)
    graph[b].append(a)
}

var isVisited = Array(repeating: false, count: n + 1)

var parentArray = Array(repeating: 0, count: n + 1)

func dfs(_ node: Int) {
    isVisited[node] = true
    for nextNode in graph[node] {
        if !isVisited[nextNode] {
            parentArray[nextNode] = node
            dfs(nextNode)
        }
    }
}

dfs(1)

for i in 2..<n + 1{
    print(parentArray[i])
}
