import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var size: Int { input.count + output.count }
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()!
    }
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])

var graph = [[Int]]()
var queue = Queue<(Int, Int)>()
var day = 0

for i in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(row)
    for j in 0..<m {
        if row[j] == 1 {
            queue.enqueue((i, j))
        }
    }
}

func bfs() {
    while !queue.isEmpty {
        let (currentX, currentY) = queue.dequeue()
        
        for i in 0..<4 {
            let nextX = currentX + dx[i]
            let nextY = currentY + dy[i]
            
            if nextX >= 0 && nextX < n && nextY >= 0 && nextY < m {
                if graph[nextX][nextY] == 0 {
                    graph[nextX][nextY] = graph[currentX][currentY] + 1
                    queue.enqueue((nextX, nextY))
                }
            }
        }
    }
}

bfs()

var resultBool = false

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 0 {
            resultBool = true
            break
        }
        day = max(day, graph[i][j])
    }
}

if resultBool {
    print(-1)
} else {
    print(day - 1)
}
