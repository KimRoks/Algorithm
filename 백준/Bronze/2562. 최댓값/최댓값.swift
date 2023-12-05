var arr = [Int]()
for _ in 1...9 {
    let input = Int(readLine()!)!
    arr.append(input)
}
let max = arr.max()!
let result = arr.lastIndex(of: max)! + 1
print("\(max)\n\(result)")
