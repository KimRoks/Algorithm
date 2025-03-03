import Foundation

let n = Int(readLine()!)!
let str = String(n, radix: 2)
let result = str.filter{ $0 == "1" }.count
print(result)