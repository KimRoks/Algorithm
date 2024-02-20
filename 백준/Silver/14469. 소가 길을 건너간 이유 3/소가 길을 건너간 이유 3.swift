let n = Int(readLine()!)!

var result = 0
var arr = [[Int]]()
for _ in 1...n {
    let xy = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(xy)
}
arr.sort(by: { $0[0] < $1[0] })

for i in 0..<arr.count {
    let (x,y) = (arr[i][0],arr[i][1])
    
    if result < x {
        result = (x + y)
        
    } else {
        result += (y)
    }
}

print(result)
