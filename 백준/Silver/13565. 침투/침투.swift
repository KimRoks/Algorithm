let nm = readLine()!.split(separator: " ").map{Int($0)!}
let (n,m) = (nm[0],nm[1])
var graph = [[Int]]()

var isVisted = Array(
    repeating: Array(repeating: false, count: m)
    , count: n
)

let dX = [0,0,1,-1]
let dy = [-1,1,0,0]

var result = false

for _ in 0..<n {
    let input = readLine()!.map{ Int(String($0))! }
    graph.append(input)
}

func bfs(startX: Int, startY: Int) -> Bool {
    var q: [[Int]] = [[startX,startY]]
    isVisted[startX][startY] = true
    var count = 0
    
    while !q.isEmpty {
        let current = q.removeFirst()
        let currentX = current[0]
        let currentY = current[1]
        
        if currentX == n - 1 {
            return true
        }
        
        for i in 0..<4 {
            let nextX = currentX + dX[i]
            let nextY = currentY + dy[i]
            
            if nextX >= 0, nextX < n, nextY >= 0 , nextY < m {
                if !isVisted[nextX][nextY] && graph[nextX][nextY] == 0 {
                    q.append([nextX,nextY])
                    isVisted[nextX][nextY] = true
                    count += 1
                }
            }
        }
    }
    return false
}


for j in 0..<m {
    if graph[0][j] == 0 && !isVisted[0][j] {
        if bfs(startX: 0, startY: j) {
            result = true
            break
        }
    }
}
print(result ? "YES" : "NO")
