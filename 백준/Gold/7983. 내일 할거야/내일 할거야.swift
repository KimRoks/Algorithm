let n = Int(readLine()!)!

var result = 0
var arr = [[Int]]()

for _ in 1...n {
    let dt = readLine()!.split(separator: " ").map{ Int($0)! }
    arr.append(dt)
}
arr.sort(by: { $0[1] > $1[1] })

result = arr[0].last! - arr[0].first!

for i in 1..<arr.count {
    if result > arr[i].last! {
        result = arr[i].last! - arr[i].first!
    } else {
        result -= arr[i].first!
    }
}

print(result)
