import Foundation

let n = Int(readLine()!)!

var arr = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}
arr.sort()

var result = arr.min()! * n

for i in 0..<arr.count {
    if result < arr[i] * (n - i) {
        result = arr[i] * (n - i)
    }
}


print(result)
