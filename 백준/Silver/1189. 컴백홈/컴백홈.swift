import Foundation

// 입력 받기
let rck = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, k) = (rck[0], rck[1], rck[2])

var graph: [[String]] = []
for _ in 0..<r {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

let direction = [(-1, 0), (0, 1), (1, 0), (0, -1)]

// 시작 위치 설정
var result = 0
graph[r - 1][0] = "1"

// DFS 함수 정의
func dfs(row: Int, col: Int) {
    if row == 0 && col == c - 1 {
        if Int(graph[row][col]) == k {
            result += 1
        }
        return
    }
    
    for move in direction {
        let nrow = row + move.0
        let ncol = col + move.1
        
        if nrow >= 0 && ncol >= 0 && nrow < r && ncol < c {
            if graph[nrow][ncol] == "." {
                graph[nrow][ncol] = String((Int(graph[row][col]) ?? 0) + 1)
                dfs(row: nrow, col: ncol)
                // 다음의 케이스에서 이용하기 위해서 방문처리를 해제해줍니다.
                graph[nrow][ncol] = "."
            }
        }
    }
}

// DFS 시작
dfs(row: r - 1, col: 0)
print(result)
