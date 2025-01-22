let nk = readLine()!.split(separator: " ").map{Int($0)!}

// n: 총 날짜수, k: 연속 날짜 수
let (n,k) = (nk[0],nk[1])

let input = readLine()!.split(separator: " ").map{Int($0)!}

var initialSum = input[0..<k].reduce(0, +)
var maxResult = initialSum

for i in k..<n {
    initialSum = initialSum - input[i - k] + input[i]
    maxResult = max(maxResult, initialSum)
}

print(maxResult)

