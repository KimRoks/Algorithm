
import Foundation

let ncardCount = Int(readLine()!)!
let nCardList = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let mCardCount = Int(readLine()!)!
let mCardList = readLine()!.split(separator: " ").map { Int($0)! }
var result = [String]()

var count = 0

for i in 0..<mCardCount {
    
    var left = 0
    var right = ncardCount - 1
    var check: Bool = false
    while left <= right {
        let mid = (left + right) / 2
        
        if mCardList[i] == nCardList[mid] {
            check = true
            break
        }
        
        if mCardList[i] <= nCardList[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    if check == true {
        result.append("1")
    } else {
        result.append("0")
    }
}

print(result.joined(separator: " "))