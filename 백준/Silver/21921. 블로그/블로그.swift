let nx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, x) = (nx[0], nx[1])

let input = readLine()!.split(separator: " ").map { Int($0)! }

var initialSum = input[0..<x].reduce(0, +)
var result = initialSum
var resultCount = 1

for i in x..<n {
    initialSum = initialSum - input[i - x] + input[i]
    if initialSum > result {
        result = initialSum
        resultCount = 1 // 새로운 최대값이 등장했으므로 초기화
    } else if initialSum == result {
        resultCount += 1 // 같은 최대값이 등장했으므로 증가
    }
}

if result == 0 {
    print("SAD")
} else {
    print(result)
    print(resultCount)
}
