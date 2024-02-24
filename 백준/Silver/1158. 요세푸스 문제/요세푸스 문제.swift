let nk = readLine()!.split(separator: " ").map{Int($0)!}
let (n,k) = (nk[0], nk[1])
var count = 0
var result = [Int]()

var q = Queue()

for i in 1...n {
    q.enqueue(i)
}

while !q.isEmpty {
    count += 1
    if count % k == 0 {
        result.append(q.dequeue()!)
        count = 0
    } else {
        q.enqueue(q.dequeue()!)
    }
}

print("<\(result.map{ String($0)}.joined(separator: ", "))>")

struct Queue {
    var input = [Int]()
    var output = [Int]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var size: Int {
        input.count + output.count
    }
    
    var front: Int? {
        if output.isEmpty {
            return input.first
        }
        return output.last
    }
    
    var back: Int? {
        if input.isEmpty {
            return output.first
        }
        return input.last
    }
    
    mutating func enqueue(_ new: Int) {
        input.append(new)
    }
    
    mutating func dequeue() -> Int? {
        if output.isEmpty {
            output = input.reversed()
            input = [Int]()
        }
        return output.popLast()
    }
}
