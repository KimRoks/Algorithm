import Foundation

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

let n = Int(readLine()!)!
var graph: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

var maxRainHeight = 0
for i in 0..<n {
    for j in 0..<n {
        maxRainHeight = max(graph[i][j], maxRainHeight)
    }
}

func bfs(startX: Int, startY: Int, rainHeight: Int, _ visited: inout [[Bool]]) {
    var queue = [(startX, startY)]
    visited[startX][startY] = true
    
    while !queue.isEmpty {
        let (currentX, currentY) = queue.removeFirst()
        
        for i in 0..<4 {
            let nextX = currentX + dx[i]
            let nextY = currentY + dy[i]
            
            if nextX >= 0, nextX < n, nextY >= 0, nextY < n {
                if !visited[nextX][nextY] && graph[nextX][nextY] > rainHeight {
                    visited[nextX][nextY] = true
                    queue.append((nextX, nextY))
                }
            }
        }
    }
}

var result = 1 // 최소 안전 영역 개수는 1 (모두 잠기지 않을 때)

// 모든 강수량에 대해 반복
for rainHeight in 0...maxRainHeight {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var safeAreaCount = 0
    
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] > rainHeight && !visited[i][j] {
                bfs(startX: i, startY: j, rainHeight: rainHeight, &visited)
                safeAreaCount += 1
            }
        }
    }
    result = max(result, safeAreaCount)
}

print(result)
