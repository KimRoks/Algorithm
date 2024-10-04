let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: n + 1)
let forResult = 15746

dp[0] = 1
dp[1] = 2
for i in 2..<n+1 {
    dp[i] = (dp[i - 1] + dp[i - 2]) % forResult
}
print(dp[n - 1])

