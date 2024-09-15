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
            input = [T]()
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
var dfsString = [String]()
func dfs(_ index: Int) {
    dfsString.append("\(index + 1)")
    isVisited[index] = true
    
    for vertex in graph[index] {
        if !isVisited[vertex] {
            dfs(vertex)
        }
    }
}
dfs(v)
print(dfsString.joined(separator: " "))

isVisited = [Bool](repeating: false, count: n)
var bfsString = [String]()
var q = Queue<Int>()
q.enqueue(v)
while !q.isEmpty {
    let index = q.dequeue()
    if isVisited[index] {
        continue
    }
    bfsString.append("\(index + 1)")
    isVisited[index] = true
    
    for vertex in graph[index] where !isVisited[vertex] {
        q.enqueue(vertex)
    }
}
print(bfsString.joined(separator: " "))
