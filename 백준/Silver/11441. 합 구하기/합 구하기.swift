let n = Int(readLine()!)!

let arr = readLine()!.split(separator: " ").map { Int($0)! }

let m = Int(readLine()!)!

var prefix = [0] + Array(repeating: 0, count: n)
for i in 1...n {
    prefix[i] = prefix[i-1] + arr[i-1]
}

for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j) = (ij[0], ij[1])
    
    print(prefix[j] - prefix[i-1])
}
