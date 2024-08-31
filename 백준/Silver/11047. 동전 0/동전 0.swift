let nk = readLine()!.split(separator: " ").map{ Int($0)! }

var (n,k) = (nk[0], nk[1])

var value = [Int]()

for _ in 0..<n {
    value.append(Int(readLine()!)!)
}

var result = 0


while k != 0 {

    if k >= value[n - 1] {
        k -= value[n - 1]
        result += 1
    }
    
    if k < value[n - 1] {
        n -= 1
    }
}

print(result)
