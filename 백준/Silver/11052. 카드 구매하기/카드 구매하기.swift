let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map {Int($0)!}
var dp = [Int](repeating: 0, count: n+1)

for i in 1..<n+1 {
    for j in 1..<i+1 {
        dp[i] = max(dp[i], dp[i-j]+input[j-1])
    }
}
print(dp[n])
