import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

func isCoverd(with height: Int) -> Bool {
    var lastCovered = 0
    for i in input {
        if i - height > lastCovered {
            return false
        }
        lastCovered = i + height
    }
    return lastCovered >= n
}

var left = 0
var right = n
var answer = n

while left <= right {
    let mid = (left + right) / 2
    if isCoverd(with: mid) {
        answer = mid
        right = mid - 1
    } else {
        left = mid + 1
    }
}

print(answer)
