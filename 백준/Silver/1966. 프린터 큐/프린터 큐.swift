struct Queue {
    var input: [(Int, Int)] = [] // (중요도, 인덱스)
    
    var isEmpty: Bool {
        input.isEmpty
    }
    
    var count: Int {
        input.count
    }
    
    mutating func enqueue(_ element: (Int, Int)) {
        input.append(element)
    }
    
    mutating func dequeue() -> (Int, Int)? {
        return isEmpty ? nil : input.removeFirst()
    }
    
    func peek() -> (Int, Int)? {
        return input.first
    }
    
    mutating func rotate() {
        if let first = dequeue() {
            enqueue(first)
        }
    }
}

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    // 문서 갯수, 보고 싶은 인덱스
    let (_, m) = (input[0], input[1])
    let importance = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var q = Queue()
    for i in 0..<importance.count {
        q.enqueue((importance[i], i))
    }
    
    var count = 0
    
    while !q.isEmpty {
        if let current = q.peek() {
            if current.0 == q.input.map({ $0.0 }).max() {
                count += 1
                let dequeued = q.dequeue()
                if dequeued?.1 == m {
                    print(count)
                    break
                }
            } else {
                q.rotate()
            }
        }
    }
}
