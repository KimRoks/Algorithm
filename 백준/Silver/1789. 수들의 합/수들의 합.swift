let S = Int(readLine()!)!

var sum = 0
var count = 1

while sum <= S {
    let current = sum + count
    if current > S {
        count -= 1
        break
    } else {
        sum = current
        count += 1
    }
}

print(count)

