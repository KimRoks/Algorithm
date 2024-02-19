import Foundation

let n = Int(readLine()!)!
var arr: [[Int]] = []
for _ in 1...n {
    let xy = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(xy)
}

arr.sort {
    if $0[0] != $1[0] {
        return $0[0] < $1[0]
    } else  {
        return $0[1] < $1[1]
    }
}

for i in 0...arr.count - 1 {
    print("\(arr[i][0]) \(arr[i][1])")
}
