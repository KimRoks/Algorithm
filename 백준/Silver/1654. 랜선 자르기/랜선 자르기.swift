let KN = readLine()!.split(separator: " ").map { Int($0)! }

let (k,n) = (KN[0], KN[1])

var arrays = [Int]()
var result = 0

for _ in 0..<k {
    let input = Int(readLine()!)!
    
    arrays.append(input)
}

var left = 1
var right = arrays.max()!

while left <= right {
    let mid = (left + right) / 2
    var count = 0
    
    for array in arrays {
        count += array / mid
    }
    
    if count >= n {
        if result < mid {
            result = mid
        }
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(result)

