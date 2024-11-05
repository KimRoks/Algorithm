let testCase = Int(readLine()!)!
let dx = [-1, -2, -2, -1, 1, 2, 2, 1]
let dy = [-2, -1, 1, 2, 2, 1, -1, -2]

for _ in 0..<testCase {
    let l = Int(readLine()!)!
    
    let startIndex = readLine()!.split(separator: " ").map{Int($0)!}
    let endIndex = readLine()!.split(separator: " ").map{Int($0)!}
    
    let (startX, startY) = (startIndex[0],startIndex[1])
    let (endX, endY) = (endIndex[0], endIndex[1])
    
    
    func bfs(startX: Int, startY: Int, endX: Int, endY: Int) -> Int {
        var count = 0
        var isVisited = Array(
            repeating: Array(repeating: false, count: l),
            count: l
        )
        var queue = [[startX,startY]]
        isVisited[startX][startY] = true
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let current = queue.removeFirst()
                let currentX = current[0]
                let currentY = current[1]
                
                if currentX == endX && currentY == endY {
                    return count
                }
                
                for i in 0..<8 {
                    let nextX = currentX + dx[i]
                    let nextY = currentY + dy[i]
                    
                    if nextX >= 0 && nextX < l && nextY >= 0 && nextY < l {
                        if !isVisited[nextX][nextY] {
                            queue.append([nextX, nextY])
                            isVisited[nextX][nextY] = true
                        }
                    }
                }
            }
            count += 1
        }
        return -1
    }
    print(bfs(startX: startX, startY: startY, endX: endX, endY: endY))
}
