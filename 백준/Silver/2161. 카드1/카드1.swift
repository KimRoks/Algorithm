struct Queue {
    private var input = [Int]()
    private var output = [Int]()
    
    mutating func enqueue(_ new: Int) {
        input.append(new)
    }
    
    mutating func dequeue() -> Int {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.removeLast()
    }
    
    mutating func count() -> Int {
        return input.count + output.count
    }
    var peek: Int {
        if output.isEmpty {
            return input.first!
        }
        return output.last!
    }
}

let input = Int(readLine()!)!
var q = Queue()

for i in 1...input {
    q.enqueue(i)
}

var resultArr: [Int] = []

while q.count() != 1 {
    resultArr.append(q.dequeue())
    q.enqueue(q.dequeue())
}

resultArr.append(q.dequeue())

print(resultArr.map{String($0)}.joined(separator: " "))

