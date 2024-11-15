let n = Int(readLine()!)!

var arr: [Int] = []

for _ in 0..<n {
    let input = Int(readLine()!)!
    arr.append(input)
}

arr.sort(by: >)

for item in arr {
    print(item)
}
