let n = Int(readLine()!)!

var graph = [[String]]()
var isVisited = Array(
    repeating: Array(repeating: false, count: n),
    count: n
)

for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

// 상하좌우 방향
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

func bfs(startX: Int, startY: Int, isBlind: Bool) {
    var queue = [[startX, startY]]
    isVisited[startX][startY] = true
    let currentColor = graph[startX][startY]

    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentX = current[0]
        let currentY = current[1]

        for i in 0..<4 {
            let nextX = currentX + dx[i]
            let nextY = currentY + dy[i]

            if nextX >= 0, nextX < n, nextY >= 0, nextY < n, !isVisited[nextX][nextY] {
                if isBlind {
                    // 색맹의 경우: R과 G를 동일하게 처리하고 B는 별도로 구분
                    if (currentColor == "R" || currentColor == "G"),
                       (graph[nextX][nextY] == "R" || graph[nextX][nextY] == "G") {
                        queue.append([nextX, nextY])
                        isVisited[nextX][nextY] = true
                    } else if currentColor == "B", graph[nextX][nextY] == "B" {
                        queue.append([nextX, nextY])
                        isVisited[nextX][nextY] = true
                    }
                } else {
                    // 비색맹의 경우: 정확히 같은 색만 처리
                    if graph[nextX][nextY] == currentColor {
                        queue.append([nextX, nextY])
                        isVisited[nextX][nextY] = true
                    }
                }
            }
        }
    }
}

// 결과 변수
var normalCount = 0
var blindCount = 0

// 비색맹인 경우
for i in 0..<n {
    for j in 0..<n {
        if !isVisited[i][j] {
            bfs(startX: i, startY: j, isBlind: false)
            normalCount += 1
        }
    }
}

// 초기화 후 색맹인 경우
isVisited = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n {
    for j in 0..<n {
        if !isVisited[i][j] {
            bfs(startX: i, startY: j, isBlind: true)
            blindCount += 1
        }
    }
}

print(normalCount, blindCount)
