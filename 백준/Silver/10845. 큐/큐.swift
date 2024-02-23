import Foundation

let n = Int(readLine()!)!

var queue = Queue()

for _ in 1...n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    switch input[0] {
    case "push":
        queue.enqeueu(Int(input[1])!)
    case "pop":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.deqeueu()!)
        }
    case "size":
        print(queue.size)
    case "empty":
        if queue.isEmpty {
            print(1)
        } else {
            print(0)
        }
    case "front":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.front!)
        }
    case "back":
        if queue.isEmpty {
            print(-1)
        } else {
            print(queue.back!)
        }    
    default:
        break
    }
}

struct Queue {
    var input = [Int]()
    var output = [Int]()
    
    var size: Int { input.count + output.count}
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
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
    
    mutating func enqeueu(_ new: Int) {
        input.append(new)
    }
    
    mutating func deqeueu() -> Int? {
        if output.isEmpty {
            output = input.reversed()
            input = [Int]()
        }

        return output.popLast()
    }
}

