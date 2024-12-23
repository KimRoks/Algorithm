import Foundation

let n = Int(readLine()!)!
var graph = [[Int]]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

var resultArr = Array(
    repeating: Array(
        repeating: 0, count: n
    ), count: n
)

func bfs(start: Int) {
    var visited = Array(
        repeating: false,
        count: n
    )
    var queue = [start]

    while !queue.isEmpty {
        let current = queue.removeFirst()

        for next in 0..<n {
            if graph[current][next] == 1 && !visited[next] {
                visited[next] = true
                queue.append(next)
                resultArr[start][next] = 1
            }
        }
    }
}

for i in 0..<n {
    bfs(start: i)
}

for row in resultArr {
    print(row.map { String($0) }.joined(separator: " "))
}
