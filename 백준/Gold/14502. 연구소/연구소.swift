import Foundation

// 큐 구조체 정의
struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var size: Int { input.count + output.count }
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    var front: T? {
        if output.isEmpty {
            return input.first
        }
        return output.last
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}

// 입력 처리
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph = [[Int]]()
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

for _ in 0..<n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// BFS 함수
func bfs(startGraph: [[Int]]) -> [[Int]] {
    var tempGraph = startGraph
    var queue = Queue<(Int, Int)>()
    
    // 바이러스 위치를 큐에 추가
    for i in 0..<n {
        for j in 0..<m {
            if tempGraph[i][j] == 2 {
                queue.enqueue((i, j))
            }
        }
    }
    
    // BFS 시작
    while !queue.isEmpty {
        let (currentN, currentM) = queue.dequeue()!
        
        for i in 0..<4 {
            let nextN = currentN + dy[i]
            let nextM = currentM + dx[i]
            
            if nextN >= 0, nextN < n, nextM >= 0, nextM < m {
                if tempGraph[nextN][nextM] == 0 {
                    tempGraph[nextN][nextM] = 2
                    queue.enqueue((nextN, nextM))
                }
            }
        }
    }
    
    return tempGraph
}

// 안전 영역 크기 계산
func getSafeArea(_ graph: [[Int]]) -> Int {
    var safeArea = 0
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 0 {
                safeArea += 1
            }
        }
    }
    return safeArea
}

// 벽을 세우고 시뮬레이션 실행
func simulate() -> Int {
    var maxSafeArea = 0
    let emptySpaces = getEmptySpaces()
    let combinations = generateCombinations(emptySpaces, count: 3)
    
    for walls in combinations {
        var tempGraph = graph
        
        // 벽 세우기
        for (x, y) in walls {
            tempGraph[x][y] = 1
        }
        
        // 바이러스 퍼뜨리기
        let infectedGraph = bfs(startGraph: tempGraph)
        
        // 안전 영역 계산
        let safeArea = getSafeArea(infectedGraph)
        maxSafeArea = max(maxSafeArea, safeArea)
    }
    
    return maxSafeArea
}

// 빈 칸 좌표 찾기
func getEmptySpaces() -> [(Int, Int)] {
    var emptySpaces = [(Int, Int)]()
    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 0 {
                emptySpaces.append((i, j))
            }
        }
    }
    return emptySpaces
}

// 조합 생성 함수
func generateCombinations(_ elements: [(Int, Int)], count: Int) -> [[(Int, Int)]] {
    if count == 0 { return [[]] }
    if elements.isEmpty { return [] }
    
    let head = elements[0]
    let tail = Array(elements.dropFirst())
    
    let withoutHead = generateCombinations(tail, count: count)
    let withHead = generateCombinations(tail, count: count - 1).map { $0 + [head] }
    
    return withHead + withoutHead
}

// 실행
print(simulate())
