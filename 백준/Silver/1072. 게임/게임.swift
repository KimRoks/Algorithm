import Foundation

let xy = readLine()!.split(separator: " ").map{Int($0)!}

let (x,y) = (xy[0], xy[1])

let z = y * 100 / x

var left = 0
var right = 1000000001
var count = -1

while left <= right {
    
    let mid = (left + right) / 2
    
    let newX = x + mid
    let newY = y + mid
    let newZ = newY * 100 / newX
    
    if z != newZ {
        right = mid - 1
        count = mid
    } else {
        left = mid + 1
    }
}

print(count)
