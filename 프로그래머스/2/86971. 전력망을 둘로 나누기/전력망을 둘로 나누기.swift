import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: 0), count: n+1)
    var chk: [Bool] = []

    for w in wires {
        graph[w[0]] += [w[1]]
        graph[w[1]] += [w[0]]
    }
    
    func bfs(_ graph: [[Int]],_ index: Int) -> Int {
        var q: [Int] = [index]

        var count = 0
        while q.count > 0 {
            let now = q.remove(at: 0)
            chk[now] = true
            count += 1
            let nexts = graph[now]
            for ni in nexts {
                if !chk[ni] {
                    q.append(ni)
                }
            }
        }
        return count
    }

    
    var count = Int.max
    for wire in wires {
        chk = Array(repeating: false, count: n+1)
        var newGraph = graph
        newGraph[wire[0]] = newGraph[wire[0]].filter { $0 != wire[1] }
        newGraph[wire[1]] = newGraph[wire[1]].filter { $0 != wire[0] }
    
        let firstCount = bfs(newGraph, wire[0])
        let secondCount = bfs(newGraph, wire[1])
        count = min(count, abs(firstCount - secondCount))
    }
    return count
}
