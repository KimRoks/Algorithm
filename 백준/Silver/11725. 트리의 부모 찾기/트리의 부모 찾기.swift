import Foundation

let n = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: n + 1)
for _ in 0..<n - 1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    graph[a].append(b)
    graph[b].append(a)
}

var parent = Array(repeating: 0, count: n + 1) 
var isVisited = Array(repeating: false, count: n + 1)

func dfs(start: Int) {
    var stack = [start]
    isVisited[start] = true

    while !stack.isEmpty {
        let node = stack.removeLast() 

        for nextNode in graph[node] {
            if !isVisited[nextNode] {
                isVisited[nextNode] = true
                parent[nextNode] = node 
                stack.append(nextNode) 
            }
        }
    }
}

dfs(start: 1)

for i in 2...n {
    print(parent[i])
}
