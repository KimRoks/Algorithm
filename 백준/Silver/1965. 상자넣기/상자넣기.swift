import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i {
        if input[j] < input[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
