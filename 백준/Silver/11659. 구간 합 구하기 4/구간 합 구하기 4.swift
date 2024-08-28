import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let arr = readLine()!.split(separator: " ").map { Int($0)! }

var prefixSum = [Int](repeating: 0, count: n + 1)
for i in 1...n {
    prefixSum[i] = prefixSum[i - 1] + arr[i - 1]
}

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    

    let result = prefixSum[b] - prefixSum[a - 1]
    print(result)
}
