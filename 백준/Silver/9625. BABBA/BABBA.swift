let k = Int(readLine()!)!

var acount = 0
var bcount = 0
var dp = [(1,0), (0,1), (1,1), (1,2), (2,3)] + [(Int, Int)](repeating: (0, 0), count: 41)


for i in 5..<dp.count {
    dp[i] = (
        dp[i - 1].0 + dp[i - 2].0,
        dp[i - 2].1 + dp[i - 1].1
    )
}

print(dp[k].0, dp[k].1)
