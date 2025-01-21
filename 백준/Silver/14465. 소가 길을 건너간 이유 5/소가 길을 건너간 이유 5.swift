
// 총길이: n, 원하는 길이: k, 고장난거: b

let nkb = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k, b) = (nkb[0], nkb[1], nkb[2])

var lightArr = Array(repeating: 1, count: n)

for _ in 0..<b {
    let input = Int(readLine()!)!
    lightArr[input - 1] = 0
}

var left = 0
var count = 0

for i in 0..<k {
    if lightArr[i] == 0 {
        count += 1
    }
}

var result = count

for i in k..<n {
    if lightArr[i] == 0 {
        count += 1
    }
    if lightArr[left] == 0 {
        count -= 1
    }
    left += 1
    result = min(result, count)
}

print(result)
