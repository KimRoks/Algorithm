let t = Int(readLine()!)!

var dp = [0, 1, 1, 1, 2, 2, 3, 4, 5, 7, 9] + Array(repeating: 0, count: 91)

for i in 11..<101 {
    dp[i] = dp[i - 2] + dp[i - 3]
}

for _ in 0..<t {
    let input = Int(readLine()!)!
    print(dp[input])
}
