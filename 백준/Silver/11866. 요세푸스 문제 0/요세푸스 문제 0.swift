let nk = readLine()!.split(separator: " ").map{ Int($0)! }

let (n,k) = (nk[0], nk[1] - 1)

var arr = [Int]()

for i in 1...n {
    arr.append(i)
}
var resultArr = [Int]()
var index = 0

while !arr.isEmpty {
    index = (index + k) % arr.count
    let kNumber = arr.remove(at: index)
    resultArr.append(kNumber)
}

print("<" + resultArr.map { String($0) }.joined(separator: ", ") + ">")
