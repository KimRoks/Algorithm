let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var board = [[Int]]()
    for _ in 0..<2 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        board.append(input)
    }

    var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)

    dp[0][0] = board[0][0]
    dp[1][0] = board[1][0]

    if n == 1 {
        print(max(dp[0][0], dp[1][0]))
        continue
    }

    dp[0][1] = board[0][1] + dp[1][0]
    dp[1][1] = board[1][1] + dp[0][0]

    for i in 2..<n {
        dp[0][i] = max(dp[1][i - 1], dp[1][i - 2]) + board[0][i]
        dp[1][i] = max(dp[0][i - 1], dp[0][i - 2]) + board[1][i]
    }

    print(max(dp[0][n - 1], dp[1][n - 1]))
}
