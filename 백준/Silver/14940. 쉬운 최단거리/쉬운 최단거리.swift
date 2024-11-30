let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

let dm = [0, 0, -1, 1]
let dn = [-1, 1, 0, 0]

// -1을 가지 않은곳으로 사용
var distance = Array(
    repeating: Array(
        repeating: -1,
        count: m
    ),
    count: n
)

func bfs(startN: Int, startM: Int) {
    var queue = [(N: Int, M: Int)]()
    queue.append((startN, startM))
    distance[startN][startM] = 0

    while !queue.isEmpty {
        let current = queue.removeFirst()

        for i in 0..<4 {
            let nextN = current.0 + dn[i]
            let nextM = current.1 + dm[i]

            if nextN >= 0, nextN < n, nextM >= 0, nextM < m {
                // 다음이 갈 수 있는 땅이고, 방문하지 않았다면
                if graph[nextN][nextM] == 1 && distance[nextN][nextM] == -1 {
                    distance[nextN][nextM] = distance[current.0][current.1] + 1
                    queue.append((nextN, nextM))
                }
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 2 {
            bfs(startN: i, startM: j)
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 0 {
            distance[i][j] = 0
        }
    }
}

for row in distance {
    print(row.map { String($0) }.joined(separator: " "))
}
