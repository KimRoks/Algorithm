import Foundation

let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map { Int($0)! }
let total = Int(readLine()!)!

var left = 0
var right = input.max()!
var result = 0

while left <= right {
    let mid = (left + right) / 2
    
    // 현재 상한액(mid)로 배정한 예산의 총합 계산
    let allocated = input.map { min($0, mid) }.reduce(0, +)
    
    if allocated <= total {
        result = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(result)
