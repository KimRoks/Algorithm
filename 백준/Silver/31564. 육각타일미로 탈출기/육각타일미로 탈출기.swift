let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

// 통과할 수 있는 곳은 전부 0으로 초기화
var graph = Array(
    repeating: Array(
        repeating: 0,
        count: m
    ),
    count: n
)

// 통과할 수 없는 곳을 1로 설정
for _ in 0..<k {
    let obstacle = readLine()!.split(separator: " ").map { Int($0)! }
    let (obstacleN, obstacleM) = (obstacle[0], obstacle[1])
    graph[obstacleN][obstacleM] = 1
}

var isVisited = Array(
    repeating: Array(
        repeating: false,
        count: m
    ),
    count: n
)

// 육각형 이동 방향 (좌상, 좌, 좌하, 우하, 우, 우상)

let dNOdd = [-1,0,1,1,0,-1]
let dMOdd = [0,-1,0,1,1,1]

let dNEven = [-1,0,1,1,0,-1]
let dMEven = [-1,-1,-1,0,1,0]


func bfs() -> Int {
    var queue = [[0, 0]]
    isVisited[0][0] = true
    var count = 0
    
    while !queue.isEmpty {
        let currentLevelCount = queue.count
        for _ in 0..<currentLevelCount {
            let current = queue.removeFirst()
            let currentN = current[0]
            let currentM = current[1]

            if currentN == n - 1 && currentM == m - 1 {
                return count
            }

            let (dN, dM) = currentN % 2 == 0 ? (dNEven, dMEven) : (dNOdd, dMOdd)

            for i in 0..<6 {
                let nextN = currentN + dN[i]
                let nextM = currentM + dM[i]

                if nextM >= 0 && nextM < m && nextN >= 0 && nextN < n {
                    if !isVisited[nextN][nextM] && graph[nextN][nextM] == 0 {
                        queue.append([nextN, nextM])
                        isVisited[nextN][nextM] = true
                    }
                }
            }
        }

        count += 1
    }

    return -1
}

print(bfs())
