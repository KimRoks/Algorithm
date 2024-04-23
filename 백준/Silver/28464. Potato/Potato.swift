let n = Int(readLine()!)!

var park = 0
var sungwoo = 0

let input = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
var leftIndex = 0
var rightIndex = n - 1

for _ in 0..<n {
    if leftIndex <= rightIndex {
        park += input[rightIndex]
        rightIndex -= 1
    }
    if leftIndex <= rightIndex {
        sungwoo += input[leftIndex]
        leftIndex += 1
    }
}

print(sungwoo, park)
