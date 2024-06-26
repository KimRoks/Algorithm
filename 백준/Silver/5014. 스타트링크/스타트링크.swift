import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (floors, start, end, up, down) = (input[0], input[1], input[2], input[3], input[4])

var queue = DoubleStackQueue<Floor>()
var visited = Set<Int>()

if start == end {
    print(0)
} else {
    BFS()
}

struct Floor {
    var floor: Int
    var count: Int
}

func BFS() {
    queue.enqueue(Floor(floor: start, count: 0))
    visited.insert(start)

    while !queue.isEmpty {
        let now = queue.dequeue()!

        let upFloor = now.floor + up
        let downFloor = now.floor - down
        let nextCount = now.count + 1

        if upFloor == end || downFloor == end {
            print(nextCount)
            return
        }

        // up
        if upFloor > floors || visited.contains(upFloor) {
        } else {
            queue.enqueue(Floor(floor: upFloor, count: nextCount))
            visited.insert(upFloor)
        }

        if downFloor < 1 || visited.contains(downFloor) {
        } else {
            queue.enqueue(Floor(floor: downFloor, count: nextCount))
            visited.insert(downFloor)
        }
    }

    print("use the stairs")
}

// 스택 두개로 구현한 큐
struct DoubleStackQueue<T> {
    var input: [T] = []
    var output: [T] = []

    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }

    mutating func enqueue(_ new: T) {
        input.append(new)
    }

    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input = []
        }
        return output.removeLast()
    }
}
