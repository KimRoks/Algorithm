let n = Int(readLine()!)!
var rgb = [[Int]](repeating: [0, 0, 0], count: n + 1)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    rgb[i] = input
}

var dp = [[Int]](repeating: [0, 0, 0], count: n + 1)

dp[1][0] = rgb[1][0]  // 첫 번째 집을 빨간색으로 칠할 경우
dp[1][1] = rgb[1][1]  // 첫 번째 집을 초록색으로 칠할 경우
dp[1][2] = rgb[1][2]  // 첫 번째 집을 파란색으로 칠할 경우

for i in 2...n {
    dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + rgb[i][0]
    dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + rgb[i][1]
    dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + rgb[i][2]
}

let result = min(dp[n][0], dp[n][1], dp[n][2])

print(result)
