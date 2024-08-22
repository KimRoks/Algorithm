import Foundation

// 계단 수 입력 받기
let n = Int(readLine()!)!

// 계단 점수 입력 받기
var stair = [Int]()
for _ in 0..<n {
    stair.append(Int(readLine()!)!)
}

// DP 배열 초기화
var dp = [Int](repeating: 0, count: n)

// 초기 조건 설정
if n >= 1 {
    dp[0] = stair[0]
}
if n >= 2 {
    dp[1] = stair[0] + stair[1]
}
if n >= 3 {
    dp[2] = max(stair[0] + stair[2], stair[1] + stair[2])
}

// 점화식에 따라 DP 배열 채우기
if n > 3 {
    for i in 3..<n {
        dp[i] = max(dp[i-2] + stair[i], dp[i-3] + stair[i-1] + stair[i])
    }
}

// 최종 결과 출력
print(dp[n-1])
