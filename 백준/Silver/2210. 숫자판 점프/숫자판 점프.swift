let n = 5
var graph = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

var set = Set<String>()

func bfs(startX: Int, startY: Int) {
    var queue = [(x: Int, y: Int, number: String)]()
    queue.append((x: startX, y: startY, number: "\(graph[startX][startY])"))
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        let currentX = current.x
        let currentY = current.y
        let currentNumber = current.number
        
        if currentNumber.count == 6 {
            set.insert(currentNumber)
            continue
        }
        
        for i in 0..<4 {
            let nx = currentX + dx[i]
            let ny = currentY + dy[i]
            
            if nx >= 0 && nx < n && ny >= 0 && ny < n {
                queue.append((x: nx, y: ny, number: currentNumber + "\(graph[nx][ny])"))
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        bfs(startX: i, startY: j)
    }
}

print(set.count)
