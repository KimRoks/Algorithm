let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

let sortedSet = Array(Set(input)).sorted()

var dic = [Int: Int]()
for i in 0..<sortedSet.count {
    let value = sortedSet[i]
    dic[value] = i
}

let result = input.map { dic[$0]! }

print(result.map { String($0) }.joined(separator: " "))
