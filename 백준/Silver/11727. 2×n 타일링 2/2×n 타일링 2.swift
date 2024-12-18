let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: 1001)

dp[1] = 1
dp[2] = 3
dp[3] = 5

for i in 4..<dp.count {
    dp[i] = (dp[i-1] + 2 * dp[i-2]) % 10007
}

print(dp[n])

