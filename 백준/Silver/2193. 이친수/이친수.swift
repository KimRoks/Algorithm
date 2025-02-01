let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 91)

dp[1] = 1
dp[2] = 1
dp[3] = 2

if n >= 4{
    for i in 4...n {
        dp[i] = dp[i-2] + dp[i-1]
    }

    print(dp[n])
} else {
    print(dp[n])
}


