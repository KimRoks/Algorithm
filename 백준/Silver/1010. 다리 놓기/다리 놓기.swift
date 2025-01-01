import Foundation

let testCaseCount = Int(readLine()!)!

for _ in 0..<testCaseCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]

    var result = 1
    var divisor = 1
    // 조합 계산 (C(m, n) = m! / (n! * (m-n)!)
    for i in 0..<n {
        result *= (m - i)
        divisor *= (i + 1)

        // 계산 도중 나누어서 오버플로우 방지
        result /= divisor
        divisor = 1 // 분모는 매번 초기화
    }

    print(result)
}
