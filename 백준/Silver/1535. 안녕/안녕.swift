let n = Int(readLine()!)!
let minusHP = readLine()!.split(separator: " ").map { Int($0)! } // 체력 소모량
let plustHappy = readLine()!.split(separator: " ").map { Int($0)! } // 기쁨 증가량

var dp = [Int](repeating: 0, count: 101)

for i in 0..<n {
    let hp = minusHP[i]
    let happpy = plustHappy[i]
    
    // 체력이 100부터 현재 health까지 역순으로 탐색
    for j in stride(from: 100, through: hp, by: -1) {
        dp[j] = max(dp[j], dp[j - hp] + happpy)
    }
}

print(dp[99])
