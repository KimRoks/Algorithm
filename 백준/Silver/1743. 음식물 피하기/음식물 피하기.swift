import Foundation

let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

var dm = [0, 0, -1, 1]
var dn = [-1, 1, 0, 0]

var isVisited = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0..<k {
    let rc = readLine()!.split(separator: " ").map { Int($0)! }
    let (r, c) = (rc[0] - 1, rc[1] - 1)
    isVisited[r][c] = 1
}

var resultArr = [Int]()

// 개선된 Queue 구조체
struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.popLast()!
    }
}

func bfs(startM: Int, startN: Int) {
    var queue = Queue<[Int]>()
    queue.enqueue([startM, startN])
    var count = 0
    
    while !queue.isEmpty {
        let current = queue.dequeue()
        let currentM = current[0]
        let currentN = current[1]
        
        if isVisited[currentN][currentM] == 0 {
            continue
        }
        
        isVisited[currentN][currentM] = 0
        count += 1
        
        for i in 0..<4 {
            let nextM = currentM + dm[i]
            let nextN = currentN + dn[i]
            
            if nextM < m, nextM >= 0, nextN < n, nextN >= 0 {
                if isVisited[nextN][nextM] == 1 {
                    queue.enqueue([nextM, nextN])
                }
            }
        }
    }
    resultArr.append(count)
}

for i in 0..<n {
    for j in 0..<m {
        if isVisited[i][j] == 1 {
            bfs(startM: j, startN: i)
        }
    }
}

print(resultArr.max()!)
