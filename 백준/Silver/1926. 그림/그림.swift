import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

var isVisited = Array(repeating: Array(repeating: false, count: m), count: n)

let dn = [-1, 1, 0, 0]
let dm = [0, 0, -1, 1]

func bfs(startN: Int, startM: Int) -> Int {
    var queue = [[startN, startM]]
    isVisited[startN][startM] = true
    var area = 1
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentN = current[0]
        let currentM = current[1]
        
        for i in 0..<4 {
            let nextN = currentN + dn[i]
            let nextM = currentM + dm[i]
            
            if nextN >= 0, nextN < n, nextM >= 0, nextM < m, !isVisited[nextN][nextM], graph[nextN][nextM] == 1 {
                isVisited[nextN][nextM] = true
                queue.append([nextN, nextM])
                area += 1
            }
        }
    }
    return area
}

var pictureCount = 0
var maxArea = 0

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 1 && !isVisited[i][j] {
            let area = bfs(
                startN: i,
                startM: j
            )
            pictureCount += 1
            maxArea = max(maxArea, area)
        }
    }
}

print(pictureCount)
print(maxArea)
