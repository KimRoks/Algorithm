import Foundation

let n = Int(readLine()!)!

let forResult = 10007

var dp = Array(repeating: 0, count: 1001)

dp[0] = 1
dp[1] = 2
dp[2] = 3

if n == 1{
    print(1 % forResult)
} else if n == 2{
    print(2 % forResult)
} else if n == 3{
    print(3 % forResult)
} else {
    for i in 3..<n {
        dp[i] = (dp[i - 1] + dp[i - 2]) % forResult
    }
    print(dp[n-1])
}

