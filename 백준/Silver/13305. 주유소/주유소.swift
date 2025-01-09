let n = Int(readLine()!)!

let length = readLine()!.split(separator: " ").map{Int($0)!}

let oilPice = readLine()!.split(separator: " ").map{Int($0)!}

var totalLength = length.reduce(0, +)

var result = 0

// 처음엔 가격에 상관없이 넣어야함
result += oilPice[0] * length[0]
totalLength -= length[0]

var minimumOilPrice = oilPice[0]
// 마지막 도착지에선 주유 안해도 됨
for i in 0..<oilPice.count - 1 {
    //가장 싼 가격을 구해줌
    minimumOilPrice = min(minimumOilPrice, oilPice[i])
}

result += totalLength * minimumOilPrice

print(result)
