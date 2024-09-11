let n = Int(readLine()!)!

var p = readLine()!.split(separator: " ").map{ Int($0)! }

p.sort()
var sum = 0
var result = 0

for time in p {
    sum += time
    result += sum
}

print(result)
