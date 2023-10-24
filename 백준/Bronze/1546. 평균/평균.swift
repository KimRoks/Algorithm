import Foundation
//subjectCount
let N = Double(readLine()!)
let scores = readLine()!.components(separatedBy: " ").compactMap{ Double($0) }
//maxScore
let M = scores.max()!
var reggidScore = scores.map{ Double($0) / M * 100 }.reduce(0) { $0 + $1 }
let reggidAverage = reggidScore / N!
print(reggidAverage)