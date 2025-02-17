import Foundation

// n 도시개수, m 도로개수, k 목표거리, x 출발번호
let nmkx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k, x) = (nmkx[0], nmkx[1], nmkx[2], nmkx[3])

var graph: [[Int]] = Array(repeating: [], count: n + 1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    graph[a].append(b) // 단방향이므로 b -> a는 추가하지 않음
}

// 거리 저장 배열 (-1로 초기화)
var distance = Array(repeating: -1, count: n + 1)

func bfs(start: Int) {
    var q = Q()
    q.enqueue(start)
    distance[start] = 0  // 시작 지점은 거리 0

    while !q.isEmpty {
        let current = q.dequeue()
        
        for next in graph[current] {
            if distance[next] == -1 {  // 방문하지 않은 노드라면
                distance[next] = distance[current] + 1
                q.enqueue(next)
            }
        }
    }
}

bfs(start: x)

var resultArr = [Int]()
for i in 1...n {
    if distance[i] == k {
        resultArr.append(i)
    }
}

// 결과 출력
if resultArr.isEmpty {
    print("-1")
} else {
    resultArr.forEach { print($0) }
}


struct Q {
    var input = [Int]()
    var output = [Int]()
    var isEmpty: Bool { input.isEmpty && output.isEmpty }

    mutating func enqueue(_ newElement: Int) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> Int{
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.removeLast()
    }
}
