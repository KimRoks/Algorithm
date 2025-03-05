import Foundation

let n = Int(readLine()!)!
var board = [[Int]]()
for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = Array(repeating: Array(repeating: false, count: n), count: n)
let dy = [1, 0]
let dx = [0, 1]

func dfs(_ x: Int, _ y: Int) -> Bool {
    if x < 0 || y < 0 || x >= n || y >= n || visited[x][y] {
        return false
    }
    
    if board[x][y] == -1 {
        return true
    }
    
    visited[x][y] = true
    let jump = board[x][y]
    
    for i in 0..<2 {
        let nx = x + dx[i] * jump
        let ny = y + dy[i] * jump
        if dfs(nx, ny) {
            return true
        }
    }
    
    return false
}

print(dfs(0, 0) ? "HaruHaru" : "Hing")
