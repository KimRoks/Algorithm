import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0], n = input[1], h = input[2]

var graph = [[[Int]]]()
for _ in 0..<h {
    var level = [[Int]]()
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int($0)! }
        level.append(row)
    }
    graph.append(level)
}

var queue = [(z: Int, y: Int, x: Int)]()

for z in 0..<h {
    for y in 0..<n {
        for x in 0..<m {
            if graph[z][y][x] == 1 {
                queue.append((z, y, x))
            }
        }
    }
}

let dz = [0, 0, 0, 0, 1, -1]
let dy = [1, -1, 0, 0, 0, 0]
let dx = [0, 0, 1, -1, 0, 0]

var index = 0
while index < queue.count {
    let current = queue[index]
    index += 1
    
    for i in 0..<6 {
        let nz = current.z + dz[i]
        let ny = current.y + dy[i]
        let nx = current.x + dx[i]
        
        if nz < 0 || nz >= h || ny < 0 || ny >= n || nx < 0 || nx >= m {
            continue
        }
        
        if graph[nz][ny][nx] == 0 {
            graph[nz][ny][nx] = graph[current.z][current.y][current.x] + 1
            queue.append((nz, ny, nx))
        }
    }
}

var answer = 0
for level in graph {
    for row in level {
        for tomato in row {
            if tomato == 0 {
                print(-1)
                exit(0)
            }
            answer = max(answer, tomato)
        }
    }
}
print(answer - 1)
