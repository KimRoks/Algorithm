let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (nm[0], nm[1])

let dn = [0, 0, -1, 1]
let dm = [-1, 1, 0, 0]

var graph = [[String]]()
var isVisited = Array(repeating: Array(repeating: false, count: m), count: n)

var whiteCount = 0
var blueCount = 0

for _ in 0..<n {
    let input = readLine()!.map { String($0) }
    graph.append(input)
}

func bfs(startN: Int, startM: Int, team: String) -> Int {
    var queue = [[startN, startM]]
    isVisited[startN][startM] = true
    var count = 1
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentN = current[0]
        let currentM = current[1]
        
        for i in 0..<4 {
            let nextN = currentN + dn[i]
            let nextM = currentM + dm[i]
            
            if nextN >= 0, nextN < n, nextM >= 0, nextM < m {
                if !isVisited[nextN][nextM] && graph[nextN][nextM] == team {
                    queue.append([nextN, nextM])
                    isVisited[nextN][nextM] = true
                    count += 1
                }
            }
        }
    }
    return count
}

for i in 0..<n {
    for j in 0..<m {
        if !isVisited[i][j] {
            let team = graph[i][j]
            let count = bfs(startN: i, startM: j, team: team)
            if team == "W" {
                whiteCount += count * count
            } else {
                blueCount += count * count
            }
        }
    }
}

print(whiteCount, blueCount)
