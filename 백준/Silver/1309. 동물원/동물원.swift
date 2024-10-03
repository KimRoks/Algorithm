let n = Int(readLine()!)!

var dp = Array(repeating: 0, count: max(n + 1, 4))
dp[0] = 1
dp[1] = 3
dp[2] = 7
dp[3] = 17
let forResult = 9901

if n == 0 {
    print(dp[0] % forResult)
} else if n == 1 {
    print(dp[1] % forResult)
} else if n == 2 {
    print(dp[2] % forResult)
} else if n == 3 {
    print(dp[3] % forResult)
} else {
    for i in 4...n {
        dp[i] = (dp[i-1] * 2 + dp[i-2]) % forResult
    }
    print(dp[n])
}
