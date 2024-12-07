let n = Int(readLine()!)!
var time = [Int]()
var pay = [Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    time.append(input[0])
    pay.append(input[1])
}

var dp = Array(repeating: 0, count: n + 2)

for i in (1...n).reversed() {
    if i + time[i - 1] > n + 1 {
        dp[i] = dp[i + 1]
    } else { 
        dp[i] = max(dp[i + 1], pay[i - 1] + dp[i + time[i - 1]])
    }
}

print(dp[1])

