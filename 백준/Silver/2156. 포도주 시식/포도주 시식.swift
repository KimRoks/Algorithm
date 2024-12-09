let n = Int(readLine()!)!
var wine = [Int](repeating: 0, count: n + 1)
for i in 1...n {
    wine[i] = Int(readLine()!)!
}

var dp = [Int](repeating: 0, count: n + 1)

if n >= 1 {
    dp[1] = wine[1]
}
if n >= 2 {
    dp[2] = wine[1] + wine[2]
}
if n >= 3 {
    dp[3] = max(
        wine[1] + wine[2],
        wine[1] + wine[3],
        wine[2] + wine[3]
    )
}

if n > 3 {
    for i in 4...n {
        dp[i] = max(
            dp[i - 1],
            dp[i - 2] + wine[i],
            dp[i - 3] + wine[i - 1] + wine[i]
        )
    }
}

print(dp[n])
