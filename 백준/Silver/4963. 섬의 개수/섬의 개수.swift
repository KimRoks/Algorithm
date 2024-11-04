var dd = true

while dd {
    let wh = readLine()!.split(separator: " ").map{Int($0)!}
    if wh == [0,0] {
        dd = false
        break
    }
    let (w,h) = (wh[0],wh[1])

    let dx = [0, 0, -1, 1, -1, -1, 1, 1]
    let dy = [-1, 1, 0, 0, -1, 1, -1, 1]
    
    var isVisited = Array(
        repeating: Array(repeating: false, count: w),
        count: h
    )

    var graph = [[Int]]()
    var resultCount = 0

    for _ in 0..<h {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        graph.append(input)
    }

    func bfs(startX: Int, StartY: Int) {
        var q = [[startX, StartY]]
        isVisited[startX][StartY] = true
        
        while !q.isEmpty {
            let current = q.removeFirst()
            let currentX = current[0]
            let currentY = current[1]
            
            for i in 0..<8 {
                let nextX = currentX + dx[i]
                let nextY = currentY + dy[i]
                
                if nextX >= 0 && nextX < h && nextY >= 0 && nextY < w {
                    if !isVisited[nextX][nextY] && graph[nextX][nextY] == 1 {
                        q.append([nextX, nextY])
                        isVisited[nextX][nextY] = true
                    }
                }
            }
        }
    }

    for i in 0..<h {
        for j in 0..<w {
            if graph[i][j] == 1 && !isVisited[i][j] {
                bfs(startX: i, StartY: j)
                resultCount += 1
            }
        }
    }
    
    print(resultCount)
}
