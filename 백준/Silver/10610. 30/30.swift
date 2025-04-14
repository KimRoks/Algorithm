let n = readLine()!
let arr = n.map { Int(String($0))! }

if arr.contains(0) && arr.reduce(0, +) % 3 == 0 {
    let result = arr.sorted(by: >).map { String($0) }.joined()
    print(result)
} else {
    print(-1)
}
