import Foundation

var zeroCount = [Int](repeating: 0, count: 41)
var oneCount = [Int](repeating: 0, count: 41)

zeroCount[0] = 1
oneCount[0] = 0

zeroCount[1] = 0
oneCount[1] = 1

for i in 2...40 {
    zeroCount[i] = zeroCount[i - 1] + zeroCount[i - 2]
    oneCount[i] = oneCount[i - 1] + oneCount[i - 2]
}

let testCaseCount = Int(readLine()!)!

for _ in 0..<testCaseCount {
    let n = Int(readLine()!)!
    print(("\(zeroCount[n]) \(oneCount[n])"))
}

