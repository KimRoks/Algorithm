
import Foundation

let n = Int(readLine()!)!
var values: Set<String> = []
for _ in 1...n {
    values.insert(readLine()!)
}

var result = values.sorted().sorted { $0.count < $1.count}

print(result.joined(separator: "\n"))
