import Foundation

let input = readLine()!

let splitByMinus = input.split(separator: "-")

var result = 0

let first = splitByMinus.first!
let firstGroup = first.split(separator: "+").map { Int($0)! }
result += firstGroup.reduce(0, +)

for group in splitByMinus.dropFirst() {
    let numbers = group.split(separator: "+").map { Int($0)! }
    result -= numbers.reduce(0, +)
}

print(result)
