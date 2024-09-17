let n = Int(readLine()!)!


var arr = [String]()
var dic = [String: Int]()

for _ in 0..<n {
    let input = readLine()!
    arr.append(input)
}

for item in arr {
    dic[item, default: 0] += 1
}

var result = dic.sorted {
    if $0.value == $1.value {
        return $0.key < $1.key
    } else {
        return $0.value > $1.value
    }
}

print(result[0].0)
