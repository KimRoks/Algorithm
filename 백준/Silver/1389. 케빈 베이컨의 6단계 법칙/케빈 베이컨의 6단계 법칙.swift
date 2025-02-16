import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph: [[Int]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    graph[a].append(b)
    graph[b].append(a)
}

var minSum = Int.max
var answer = -1

func bfs(start: Int) -> Int {
    var isVisited = Array(repeating: false, count: n + 1)
    var distance = Array(repeating: 0, count: n + 1)
    var q = [start]
    isVisited[start] = true
    
    while !q.isEmpty {
        let current = q.removeFirst()
        
        for item in graph[current] {
            if !isVisited[item] {
                q.append(item)
                isVisited[item] = true
                distance[item] = distance[current] + 1
            }
        }
    }
    
    return distance.reduce(0, +)
}

for i in 1...n {
    let sum = bfs(start: i)
    if sum < minSum {
        minSum = sum
        answer = i
    }
}

print(answer)
