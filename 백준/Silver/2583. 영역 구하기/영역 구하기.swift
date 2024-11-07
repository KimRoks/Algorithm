let mnk = readLine()!.split(separator: " ").map{Int($0)!}
let (m,n,k) = (mnk[0],mnk[1], mnk[2])

let dx: [Int] = [0,0,-1,1]
let dy: [Int] = [-1,1,0,0]

var graph = Array(
    repeating: Array(repeating: 0, count: n),
    count: m
)
var isVisited = Array(
    repeating: Array(repeating: false, count: n)
    , count: n
)

for _ in 0..<k {
    let square = readLine()!.split(separator: " ").map{Int($0)!}
    let (x1, y1, x2, y2) = (square[0], square[1], square[2], square[3])
    for i in y1..<y2 {
        for j in x1..<x2 {
            graph[i][j] = 1
        }
    }
}

var countArray: [Int] = []

func bfs(startX: Int, startY: Int) {
    var queue = [[startX, startY]]
    isVisited[startX][startY] = true
    var count = 1
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentX = current[0]
        let currentY = current[1]
        
        for i in 0..<4{
            let nextX = currentX + dx[i]
            let nextY = currentY + dy[i]
            
            if nextX >= 0 && nextX < m && nextY >= 0 && nextY < n {
                if !isVisited[nextX][nextY] && graph[nextX][nextY] == 0 {
                    queue.append([nextX,nextY])
                    isVisited[nextX][nextY] = true
                    count += 1
                }
            }
        }
    }
    countArray.append(count)
}

for i in 0..<m {
    for j in 0..<n {
        if graph[i][j] == 0 && !isVisited[i][j] {
            bfs(startX: i, startY: j)
        }
    }
}


countArray.sort()
print(countArray.count)
print(countArray.map { String($0) }.joined(separator: " "))
