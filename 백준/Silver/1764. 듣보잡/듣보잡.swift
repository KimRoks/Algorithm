let nm = readLine()!.split(separator: " ").map{ Int($0)! }

let (n,m) = (nm[0], nm[1])

var set1: Set<String> = []
var set2: Set<String> = []

for _ in 0..<n {
    set1.insert(readLine()!)
}
for _ in 0..<m {
    set2.insert(readLine()!)
}

var resultArr = Array(set1.intersection(set2))
resultArr.sort()
print(resultArr.count)
for i in 0..<resultArr.count {
    print(resultArr[i])
}

