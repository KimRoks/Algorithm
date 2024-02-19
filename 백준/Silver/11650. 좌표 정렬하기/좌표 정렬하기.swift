import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 1...n {
    let xy = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(xy)
}


var result = arr.sorted(by: {
    if $0[0] != $1[0] {
        return $0[0] < $1[0]
    } else if $1[1] == $1[1] {
        return $0[1] < $1[1]
    }
    return true
})


for i in 0...result.count - 1 {
    print("\(result[i][0]) \(result[i][1])")
}
