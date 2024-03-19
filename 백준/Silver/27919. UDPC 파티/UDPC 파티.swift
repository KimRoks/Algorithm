let input = readLine()!

let characterArray = Array(input)

var ucCount = 0
var dpCount = 0

var result = ["C"]


for i in 0..<characterArray.count {
    if characterArray[i] == "U" || characterArray[i] == "C" {
        ucCount += 1
    } else if characterArray[i] == "D" || characterArray[i] == "P" {
        dpCount += 1
    }
}

if ucCount >= 1 && (dpCount + 1) / 2 < ucCount{
    result.append("U")
}
if dpCount >= 1 {
    result.append("D")
    result.append("P")
}

if result.count >= 2 {
    result.removeAll{ $0 == "C" }
}


print(result.joined())
