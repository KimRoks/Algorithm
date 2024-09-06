import Foundation

var input = [Int]()

for _ in 0..<9 {
    input.append(Int(readLine()!)!)
}

let sum = input.reduce(0, +)
let target = sum - 100

var aIndex = -1
var bIndex = -1


for i in 0..<input.count {
    for j in i+1..<input.count {
        if input[i] + input[j] == target {
            aIndex = i
            bIndex = j
            break
        }
    }
    if aIndex != -1 && bIndex != -1 {
        break
    }
}

input.remove(at: bIndex)
input.remove(at: aIndex)


input.sort()

for height in input {
    print(height)
}
