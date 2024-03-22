import Foundation

struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
    mutating func enqueue(_ new: T) {
        input.append(new)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
    
    func isEmpty() -> Bool {
        return input.isEmpty && output.isEmpty
    }
}

func bfs(_ graph: [[Int]], _ N: Int, _ M: Int) -> String {
    var queue = Queue<(Int, Int)>()
    queue.enqueue((0, 0))
    var visited = Array(repeating: Array(repeating: false, count: N), count: M)
    visited[0][0] = true
    
    let dx = [1, 0]
    let dy = [0, 1]
    
    while !queue.isEmpty() {
        if let (x, y) = queue.dequeue() {
            if x == N-1 && y == M-1 {
                return "Yes"
            }
            
            for i in 0..<2 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx >= 0 && nx < N && ny >= 0 && ny < M && !visited[ny][nx] && graph[ny][nx] == 1 {
                    queue.enqueue((nx, ny))
                    visited[ny][nx] = true
                }
            }
        }
    }
    
    return "No"
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var graph: [[Int]] = []

for _ in 0..<m {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(row)
}

print(bfs(graph, n, m))
