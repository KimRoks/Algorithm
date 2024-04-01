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
        return output.removeLast()
    }
}

let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, v) = (nmv[0], nmv[1], nmv[2] - 1)

var graph = [[Int]](repeating: [], count: n)
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b) = (ab[0], ab[1])
    graph[a].append(b)
    graph[b].append(a)
}
for i in 0..<n {
    graph[i].sort(by: <)
}

var isVisited = [Bool](repeating: false, count: n)
var order = [Int](repeating: 0, count: n)
var sequence = 1

var q = Queue<Int>()
q.enqueue(v)
while !q.isEmpty {
    let index = q.dequeue()
    if isVisited[index] {
        continue
    }
    isVisited[index] = true
    order[index] = sequence
    sequence += 1
    
    for vertex in graph[index] where !isVisited[vertex] {
        q.enqueue(vertex)
    }
}

for i in 0..<n {
    print(order[i])
}

