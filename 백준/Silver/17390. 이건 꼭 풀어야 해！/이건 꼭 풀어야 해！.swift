let nq = readLine()!.split(separator: " ").map{Int($0)!}

let (n,q) = (nq[0], nq[1])

var arr = readLine()!.split(separator: " ").map{Int($0)!}

arr.sort {
    return $0 < $1
}

var prefix = [0] + Array(repeating: 0, count: n)

for i in 1...n {
    prefix[i] = prefix[i - 1] + arr[i - 1]
}

for _ in 0..<q {
    let ab = readLine()!.split(separator: " ").map{Int($0)!}
    let (a,b) = (ab[0], ab[1])
    
    let result = prefix[b] - prefix[a - 1]
    
    print(result)
}
