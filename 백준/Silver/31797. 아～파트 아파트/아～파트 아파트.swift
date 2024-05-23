let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var dic = [Int: [Int]]()
var arr = [Int]()

for i in 0..<m {
    let hands = readLine()!.split(separator: " ").map { Int($0)! }
    let (hand1, hand2) = (hands[0], hands[1])
    
    dic.updateValue(hands, forKey: i)
    arr.append(hand1)
    arr.append(hand2)
}

arr.sort()

for _ in 0..<n {
    arr.append(arr.removeFirst())
}

let target = arr.last!

for (key, value) in dic {
    if value.contains(target) {
        // 0부터 시작한 인덱스 번호였으므로
        print(key + 1)
        break
    }
}







