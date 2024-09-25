let n = Int(readLine()!)!

let input = readLine()!.split(separator: " ").map{Int($0)!}

let m = Int(readLine()!)!

let mycard = readLine()!.split(separator: " ").map{Int($0)!}

var dic = Dictionary<Int,Int>()

for i in 0..<n {
    dic[input[i], default: 0] += 1
}

var result = [Int]()
for i in 0..<m{
    result.append(dic[mycard[i]] ?? 0)
}

print(result.map{String($0)}.joined(separator: " "))
