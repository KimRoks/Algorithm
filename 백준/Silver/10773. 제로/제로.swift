let k = Int(readLine()!)!

var arr = [Int]()

for _ in 0..<k {
    let input = Int(readLine()!)!
    
    if input == 0 {
        arr.removeLast()
    } else {
        arr.append(input)
    }
}

print(arr.reduce(0, { $0 + $1 }))
