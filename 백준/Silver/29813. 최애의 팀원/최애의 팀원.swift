let n = Int(readLine()!)!
var q = Q<[(String, Int)]>()

for _ in 1...n {
    let ab = readLine()!.split(separator: " ").map{ String($0) }
    let a = ab[0]
    if let b = Int(ab[1]) {
        q.enQ(new: [(a,b)])
    }
}

while !q.isEmpty && q.size > 1  {
    
    if let student = q.deQ() {
        let passCount = ((student[0].1) - 1)
        for _ in 0..<passCount {
            pass()
        }
    }
    
    q.deQ()
}

print(q.front![0].0)

func pass () {
    if let student = q.deQ() {
        q.enQ(new: student)
    }
}

struct Q<T> {
    var input = [T]()
    var output = [T]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var size : Int {
        input.count + output.count
    }
    
    var front: T? {
        if output.isEmpty {
            return input.first
        }
        return output.last
    }
    
    mutating func enQ(new: T) {
        input.append(new)
    }
    
    mutating func deQ()-> T? {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.popLast()
    }
}
