import Foundation

// 미로의 크기 입력 받기
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0] // 행의 수
let m = nm[1] // 열의 수

// 방향 배열 (상, 하, 좌, 우)
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

// 미로 배열, 방문 여부, 거리 배열 초기화
var maze = [[Int]]() // 미로의 각 위치를 저장할 배열
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var distance = Array(repeating: Array(repeating: 0, count: m), count: n)

// 미로 정보 입력 받기
for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! } // 각 줄을 숫자로 변환
    maze.append(line)
}

// BFS 함수 정의
func bfs() {
    // 큐를 사용하여 BFS 수행 (시작점은 (0, 0))
    var queue: [[Int]] = [[0, 0]]
    visited[0][0] = true // 시작점을 방문했다고 표시
    distance[0][0] = 1   // 시작점의 거리를 1로 설정
    
    // 큐가 빌 때까지 반복
    while !queue.isEmpty {
        // 현재 위치를 꺼내기
        let current = queue.removeFirst()
        let currentX = current[0]
        let currentY = current[1]
        
        // 네 방향으로 이동 가능한지 확인
        for i in 0..<4 {
            let nextX = currentX + dx[i]
            let nextY = currentY + dy[i]
            
            // 미로의 범위를 벗어나지 않는지 확인
            if nextX < 0 || nextX >= n || nextY < 0 || nextY >= m {
                continue
            }
            
            // 이미 방문했거나, 이동할 수 없는 벽일 경우 무시
            if visited[nextX][nextY] || maze[nextX][nextY] == 0 {
                continue
            }
            
            // 이동 가능한 위치이므로 큐에 추가하고 방문 표시
            queue.append([nextX, nextY])
            visited[nextX][nextY] = true
            // 현재 위치까지의 거리 + 1을 다음 위치에 설정
            distance[nextX][nextY] = distance[currentX][currentY] + 1
        }
    }
}

// BFS 실행
bfs()

// 도착점 (rowCount-1, colCount-1)의 거리 출력
print(distance[n - 1][m - 1])
