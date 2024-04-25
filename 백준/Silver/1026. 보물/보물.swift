let n = Int(readLine()!)!

var a = readLine()!.split(separator: " ").map{Int($0)!}
var b = readLine()!.split(separator: " ").map { Int($0)! }


a.sort(by: >)
b.sort(by: <)

var result = 0

for _ in 0..<n {
    result += a.removeLast() * b.removeLast()
}

print(result)
