struct Q {
    var input: [Int] = []
    private var output: [Int] = []
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var count: Int {
        input.count + output.count
    }
    
    mutating func enqueue(newElemnet: Int) {
        input.append(newElemnet)
    }
    
    mutating func dequeue() -> Int? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.removeLast()
    }
}

let n = Int(readLine()!)!

var card = Q()

for i in 1...n {
    card.enqueue(newElemnet: i)
}

while card.count != 1 {
    let _ = card.dequeue()
    if let dd = card.dequeue() {
        card.enqueue(newElemnet: dd)
    }
}
print(card.dequeue()!)



