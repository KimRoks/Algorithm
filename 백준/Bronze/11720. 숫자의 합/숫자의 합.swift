let n = Int(readLine()!)!

let input = Array(readLine()!).map{Int(String($0))!}
var result = 0

for i in 0..<input.count {
    result += input[i]
}

print(result)


