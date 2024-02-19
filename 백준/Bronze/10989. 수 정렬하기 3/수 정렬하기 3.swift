//빈 배열 만들기
var countingNums = [Int](repeating: 0, count: 10001)
// 숫자 받기
let n = Int(readLine()!)!

for _ in 0..<n {
    countingNums[Int(readLine()!)!] += 1
}

var output = ""

for i in 1...10000 {
    
    output += String(repeating: "\(i)\n", count: countingNums[i])
}


print(output)
