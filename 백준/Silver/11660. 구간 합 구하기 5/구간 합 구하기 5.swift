import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

var prefixGraph = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)

for i in 1...n {
    for j in 1...n {
        prefixGraph[i][j] = graph[i - 1][j - 1]
                            + prefixGraph[i - 1][j]
                            + prefixGraph[i][j - 1]
                            - prefixGraph[i - 1][j - 1]
    }
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])

    let result = prefixGraph[x2][y2]
                - prefixGraph[x1 - 1][y2]
                - prefixGraph[x2][y1 - 1]
                + prefixGraph[x1 - 1][y1 - 1]

    print(result)
}
