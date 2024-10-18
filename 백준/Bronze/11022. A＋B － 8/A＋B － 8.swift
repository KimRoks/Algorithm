let input = Int(readLine()!)!

for i in 1...input {
    let ab = readLine()!.split(separator: " ").map{Int($0)!}
    print("Case #\(i): \(ab[0]) + \(ab[1]) = \(ab[0] + ab[1])")
}
