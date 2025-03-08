import Foundation

let h = readLine()!
let n = readLine()!
var count = 0
var searchRange: Range<String.Index>?

while let foundRange = h.range(of: n, options: [], range: searchRange) {
    count += 1

    searchRange = foundRange.upperBound..<h.endIndex
}

print(count)

