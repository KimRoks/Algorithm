let nmr = readLine()!.split(separator: " ").map{Int($0)!}
let (n,m,r) = (nmr[0],nmr[1],nmr[2] - 1)

var graph = Array(repeating: [Int](), count: n)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map{Int($0)! - 1}
    let (u,v) = (uv[0], uv[1])
    
    graph[u].append(v)
    graph[v].append(u)
}


for i in 0..<n {
    graph[i].sort(by: >)
}

var isVisited = Array(repeating: 0, count: n)
var count = 1

func bfs(start: Int) {
    var queue = [start]
    isVisited[start] = count
    count += 1
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        for item in graph[current] {
            if isVisited[item] == 0 {
                isVisited[item] = count
                count += 1
                queue.append(item)
            }
        }
    }
}

bfs(start: r)

for i in isVisited {
    print(i)
}
