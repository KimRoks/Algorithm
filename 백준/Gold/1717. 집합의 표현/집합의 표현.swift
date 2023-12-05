import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var arr = Array(0...n)
var result = [String]()

func find(_ index: Int) -> Int {
    if arr[index] == index {
        return index
    }
    arr[index] = find(arr[index])
    return arr[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    arr[bP] = aP
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (first, a, b) = (input[0], input[1], input[2])
    
    if first == 0 {
        union(a, b)
    } else {
        result.append(find(a) == find(b) ? "YES" : "NO")
    }
}

print(result.joined(separator: "\n"))
