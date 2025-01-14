import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let trees = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = trees.max()!
var h = 0

while left <= right {
    // 사실상 현재 톱날의 높이임
    let mid = (left + right) / 2
    
    // mid 값을 빼도 음수가 되지 않아야한다
    let wood = trees.reduce(0) { $0 + max(0, $1 - mid) }
    
    if wood >= m {
        // 가져갈 수 있는 나무가 충분하면 높이를 더 올릴 수 있음
        h = mid
        left = mid + 1
    } else {
        // 가져갈 나무가 부족하면 높이를 낮춰야 함
        right = mid - 1
    }
}

print(h)
