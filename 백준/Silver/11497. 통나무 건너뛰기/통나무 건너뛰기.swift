import Foundation

let testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let n = Int(readLine()!)!
    var arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    arr.sort()
    
    var diffArr = Array(repeating: 0, count: n)
    var left = 0
    var right = n - 1
    
    for i in 0..<n {
        if i % 2 == 0 {
            diffArr[left] = arr[i]
            left += 1
        } else {
            diffArr[right] = arr[i]
            right -= 1
        }
    }
    
    var maxDiff = abs(diffArr[0] - diffArr[n - 1])
    for i in 1..<n {
        maxDiff = max(maxDiff, abs(diffArr[i] - diffArr[i - 1]))
    }
    
    print(maxDiff)
}
