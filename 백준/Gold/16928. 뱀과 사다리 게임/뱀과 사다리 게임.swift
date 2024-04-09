import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var graph = Array(repeating: 0, count: 101)
for _ in 0..<n+m {
    let ladder = readLine()!.split(separator: " ").map { Int($0)! }
    graph[ladder[0]] = ladder[1]
}

func bfs() -> Int {
    var visited = [Bool](repeating: false, count: 101)
    var queue: [(Int, Int)] = [(1, 0)] // 시작 위치와 주사위 굴린 횟수
    visited[1] = true
    
    while !queue.isEmpty {
        let (current, diceCount) = queue.removeFirst()
        
        if current == 100 {
            return diceCount
        }
        
        for i in 1...6 {
            let next = current + i
            if next <= 100 && !visited[next] {
                visited[next] = true
                if graph[next] != 0 { // 사다리나 뱀을 만나면
                    if !visited[graph[next]] {
                        queue.append((graph[next], diceCount + 1))
                    }
                } else { // 평범한 칸이면
                    queue.append((next, diceCount + 1))
                }
            }
        }
    }
    
    return 0
}

print(bfs())

