let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let dx = [-1, 1]

var isVisited = Array(repeating: -1, count: 100001)

func bfs(start: Int, end: Int) -> Int {
    var queue = [start]
    isVisited[start] = 0

    while !queue.isEmpty {
        let current = queue.removeFirst()
    
        if current == end {
            return isVisited[current]
        }
        
        for i in 0..<2 {
            let next = current + dx[i]
            if next >= 0 && next <= 100000 && isVisited[next] == -1 {
                isVisited[next] = isVisited[current] + 1
                queue.append(next)
            }
        }
        
        let teleport = current * 2
        if teleport <= 100000 && isVisited[teleport] == -1 {
            isVisited[teleport] = isVisited[current] + 1
            queue.append(teleport)
        }
    }
    return -1
}

print(bfs(start: n, end: k))
