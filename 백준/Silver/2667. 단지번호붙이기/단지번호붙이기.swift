let n = Int(readLine()!)!

var dx = [0,0,1,-1]
var dy = [-1,1,0,0]
var graph = [[Int]]()
var resultArr = [Int]()

var isVisited = Array(
    repeating: Array(repeating: false, count: n),
    count: n
)


for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

func bfs(x: Int, y: Int) {
    var q = [[x,y]]
    isVisited[x][y] = true
    var houseCount = 1 // 시작 지점도 집이므로 1로 시작

    while !q.isEmpty {
        let current = q.removeFirst()
        let currentX = current[0]
        let currentY = current[1]
        
        for i in 0..<4{
            let nextX = currentX + dx[i]
            let nextY = currentY + dy[i]
            
            // 범위를 벗어나지 않고
            if nextX >= 0, nextX < n, nextY >= 0 , nextY < n {
                //방문하지 않았고
                if !isVisited[nextX][nextY] &&
                    //집이 있다면
                    graph[nextX][nextY] == 1 {
                    q.append([nextX,nextY])
                    isVisited[nextX][nextY] = true
                    houseCount += 1
                }
            }
        }
    }
    resultArr.append(houseCount)
}

for i in 0..<n {
    for j in 0..<n {
        if !isVisited[i][j] && graph[i][j] == 1 {
            bfs(x: i, y: j)
        }
    }
}


resultArr.sort()
print(resultArr.count)
for i in resultArr {
    print(i)
}
