import Foundation

let input = readLine()!

var arr = Array(repeating: 0, count: 10)

for char in input {
    if let num = Int(String(char)) {
        arr[num] += 1
    }
}

arr[6] = (arr[6] + arr[9] + 1) / 2
arr[9] = 0

print(arr.max()!)
