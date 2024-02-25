var n = Int(readLine()!)!
var result = 0

for i in (0...n/5).reversed() {
    if (n - (5 * i)) % 2 == 0 {
        result = i + (n - (5 * i)) / 2
        break
    }
}

print(result == 0 ? -1 : result)
