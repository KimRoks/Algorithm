let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!
    let arr = Array(input)
    var result = 0
    var count = 0
    for i in arr {
        if i == "O" {
            count += 1
            result += count
        } else {
            count = 0
        }
    }

    print(result)
}
