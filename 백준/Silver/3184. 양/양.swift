let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph = [[String.Element]]()

for _ in 0..<n {
    let input = Array(readLine()!)
    graph.append(input)
}

var dm = [0, 0, -1, 1]  // 가로 방향 (좌우)
var dn = [-1, 1, 0, 0]   // 세로 방향 (상하)

var isVisited = Array(repeating: Array(repeating: false, count: m), count: n)

var resultSheepCount = 0
var resultWolfCount = 0

func bfs(startM: Int, startN: Int) {
    var queue = [[startM, startN]]
    isVisited[startM][startN] = true
    
    var sheepCount = 0
    var wolfCount = 0
    
    if graph[startM][startN] == "o" {
        sheepCount += 1
    } else if graph[startM][startN] == "v" {
        wolfCount += 1
    }
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentM = current[0]
        let currentN = current[1]
        
        for i in 0..<4 {
            let nextM = currentM + dm[i]
            let nextN = currentN + dn[i]
            
            if nextM >= 0, nextM < n, nextN >= 0, nextN < m {
                if !isVisited[nextM][nextN], graph[nextM][nextN] != "#" {
                    
                    isVisited[nextM][nextN] = true
                    if graph[nextM][nextN] == "o" {
                        sheepCount += 1
                    } else if graph[nextM][nextN] == "v" {
                        wolfCount += 1
                    }
                    queue.append([nextM, nextN])
                }
            }
        }
    }
    
    // 구역을 다 탐색한 후 양과 늑대 비교
    if sheepCount > wolfCount {
        resultSheepCount += sheepCount
    } else {
        resultWolfCount += wolfCount
    }
}

for i in 0..<n {
    for j in 0..<m {
        if !isVisited[i][j] {
            bfs(startM: i, startN: j)
        }
    }
}

print(resultSheepCount, resultWolfCount)
