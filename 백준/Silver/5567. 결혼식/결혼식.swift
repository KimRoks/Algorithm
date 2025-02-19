let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator:" ").map{Int($0)!}
    let (a,b) = (ab[0],ab[1])
    
    graph[a].append(b)
    graph[b].append(a)
}

var isVisited: [Bool] = Array(repeating: false, count: n + 1)
var distance: [Int] = Array(repeating: -1, count: n + 1)

func bfs() {
    var q = [1]
    isVisited[1] = true
    distance[1] = 0
    
    while !q.isEmpty {
        let current = q.removeFirst()
        
        for next in graph[current] {
            if !isVisited[next] {
                isVisited[next] = true
                distance[next] = distance[current] + 1
                q.append(next)
            }
        }
    }
    
    var count = 0
    for i in 2..<n+1 {
        if distance[i] == 1 || distance[i] == 2 {
            count += 1
        }
    }
    
    print(count)
}

bfs()
